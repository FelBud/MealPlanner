<?php

namespace App\Controller;

use App\Entity\Procedure;
use App\Entity\Recipes;
use App\Entity\JoinRecipe;

use App\Entity\Ingredients;
use App\Form\RecipesType;
use App\Form\IngredientsType;
use App\Repository\ProcedureRepository;
use App\Repository\IngredientsRepository;
use App\Repository\JoinRecipeRepository;
use App\Repository\RecipesRepository;
use App\Repository\UserRepository;
use App\Repository\WeekplannerRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\FileUploadError;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\FileUploader;
use Doctrine\ORM\Mapping\Id;
use Doctrine\Persistence\ManagerRegistry;

#[Route('/recipes')]
class RecipesController extends AbstractController
{
    #[Route('/', name: 'app_recipes_index', methods: ['GET'])]
    public function index(RecipesRepository $recipesRepository): Response
    {
        return $this->render('recipes/index.html.twig', [
            'recipes' => $recipesRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_recipes_new', methods: ['GET', 'POST'])]
    public function new(ManagerRegistry $doctrine, Request $request, ProcedureRepository $procedureRepository, RecipesRepository $recipesRepository, FileUploader $fileUploader): Response
    {
        $recipe = new Recipes();
        $procedure = new Procedure();
        $ing = new Ingredients();
        $form = $this->createForm(RecipesType::class, $recipe);
        $form2 = $this->createForm(IngredientsType::class, $ing);
        $form->handleRequest($request);
        $form2->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $inputProcudure = $form->get('procedure')->getData();
            $procedure->setInstructions($inputProcudure);
            $recipe->setFkProcedure($procedure);
            $recipe->setFkUser($this->getUser());

            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                $pictureFileName = $fileUploader->upload($pictureFile);
                $recipe->setPicture($pictureFileName);
            } else {
                $recipe->setPicture("default.png");
            }

            $recipesRepository->save($recipe, true);

            $ingredients = $form2->get("name")->getData();
            $ingredients = explode(", ", $ingredients);
            $em = $doctrine->getManager();
            foreach ($ingredients as $ingredient) {

                $ing = new Ingredients();
                $joinRec = new JoinRecipe();
                $ing->setName($ingredient);
                $em->persist($ing);
                $em->flush();
                $joinRec->setFkRecipes($recipe);
                $joinRec->setFkIngredients($ing);
                $em->persist($joinRec);
                $em->flush();
            }

            $procedureRepository->save($procedure, true);

            return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('recipes/new.html.twig', [
            'recipe' => $recipe,
            'form' => $form,
            "form2" => $form2->createView()
        ]);
    }

    #[Route('/{id}/show', name: 'app_recipes_show', methods: ['GET'])]
    public function show($id, RecipesRepository $recipesRepository, JoinRecipeRepository $JoinRecipeRepository): Response
    {
        $recipes = $recipesRepository->find($id);
        $joinRecipe = $JoinRecipeRepository->findBy(array("fkRecipes" => $id));


        return $this->render('recipes/show.html.twig', [
            'recipe' => $recipes,
            'joinRecipe' => $joinRecipe,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_recipes_edit', methods: ['GET', 'POST'])]
    public function edit($id, ManagerRegistry $doctrine, Request $request, Recipes $recipe, RecipesRepository $recipesRepository, FileUploader $fileUploader): Response
    {
        $ings = $doctrine->getRepository(JoinRecipe::class)->findBy(array("fkRecipes" => $id));
        $string = "";

        foreach ($ings as $ing) {
            $string .= $ing->getFkIngredients()->getName() . ", ";
        }

        $form = $this->createForm(RecipesType::class, $recipe);
        $editIng = new Ingredients();
        $editIng->setName($string);
        $form2 = $this->createForm(IngredientsType::class, $editIng);

        $form->handleRequest($request);
        $form2->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $doctrine->getManager();
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                unlink("pictures/" . $recipe->getPicture());
                $pictureFileName = $fileUploader->upload($pictureFile);
                $recipe->setPicture($pictureFileName);
            } else {
                $recipe->setPicture("default.png");
            }

            $stringToArray = explode(", ", $string);
            foreach ($ings as $value) {
                $em->remove($value);
                $em->flush();
            }
            $ingredients = $form2->get("name")->getData();
            $ingredients = explode(", ", $ingredients);

            foreach ($ingredients as $ingredient) {
                $ing = new Ingredients();
                $joinRec = new JoinRecipe();
                $ing->setName($ingredient);
                $em->persist($ing);
                $em->flush();
                $joinRec->setFkRecipes($recipe);
                $joinRec->setFkIngredients($ing);
                $em->persist($joinRec);
                $em->flush();
            }
            $recipesRepository->save($recipe, true);

            return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('recipes/edit.html.twig', [
            'recipe' => $recipe,
            'form' => $form,
            "form2" => $form2->createView()
        ]);
    }

    #[Route('/{id}/delete', name: 'app_recipes_delete')]
    public function delete($id, WeekplannerRepository $weekplannerRepository, RecipesRepository $recipesRepository, JoinRecipeRepository $joinRecipeRepository): Response
    {
        $weekplanner = $weekplannerRepository->findBy(['fkRecipes' => $id]);

        if (count($weekplanner) == 0) {
            // fetch data to delete
            $joinRecipes = $joinRecipeRepository->findBy(['fkRecipes' => $id]);
            $recipe = $recipesRepository->find($id);

            // delete
            foreach ($joinRecipes as $joinRecipe) {
                $joinRecipeRepository->remove($joinRecipe, true);
            }
            $recipesRepository->remove($recipe, true);
        }
        
        return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
    }
}
