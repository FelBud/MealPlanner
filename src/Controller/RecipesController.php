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
    public function edit($id, ManagerRegistry $doctrine, Request $request, RecipesRepository $recipesRepository, FileUploader $fileUploader): Response
    {   $this->denyAccessUnlessGranted('ROLE_ADMIN', 'ROLE_USER'); 
        $ings = $doctrine->getRepository(JoinRecipe::class)->findBy(array("fkRecipes" => $id));
        $recipe = $doctrine->getRepository(Recipes::class)->find($id);
        $fkprocedure = $doctrine->getRepository(Recipes::class)->find($id);
        $string = "";

        foreach ($ings as $ing) {
            $string .= $ing->getFkIngredients()->getName() . ", ";
        }

        $form = $this->createForm(RecipesType::class, $recipe);
        $form->get('procedure')->setData($fkprocedure->getFkProcedure()->getInstructions());
        $editIng = new Ingredients();
        $editIng->setName($string);
        $form2 = $this->createForm(IngredientsType::class, $editIng);

        $form->handleRequest($request);
        $form2->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $doctrine->getManager();
            $recipe = $form->getData();
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                if ($recipe->getPicture() != "default.png" && $recipe->getPicture() != Null) {
                unlink("pictures/" . $recipe->getPicture());
                }
                $pictureFileName = $fileUploader->upload($pictureFile);
                $recipe->setPicture($pictureFileName);
            }

            $stringToArray = explode(", ", $string);
            foreach ($ings as $value) {
                $em->remove($value);
                $em->flush();
            }
            $ingredients = $form2->get("name")->getData();
            $ingredients = explode(", ", $ingredients);
            $inputProcudure = $form->get('procedure')->getData();
            $procedure = $doctrine->getRepository(Procedure::class)->find(array("id"=>$fkprocedure->getFkProcedure()));
            $procedure->setInstructions($inputProcudure);
            $em->persist($procedure);
            $em->flush();
            $recipe->setFkProcedure($procedure);
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
    { $this->denyAccessUnlessGranted('ROLE_ADMIN');
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

    #[Route('/vegan', name: 'app_recipes_vegan')]
    public function findByVegan(ManagerRegistry $doctrine): Response
    {
        $repository = $doctrine->getRepository(Recipes::class)/* ->findAll() */;
        $recipes = $repository->findBy(['Category' => 'vegan']);
        return $this->render('recipes/vegan.html.twig', [
            "recipes" => $recipes
        ]);
    }

    #[Route('/vegetarian', name: 'app_recipes_vegetarian')]
    public function findByVegetarian(ManagerRegistry $doctrine): Response
    {
        $repository = $doctrine->getRepository(Recipes::class)/* ->findAll() */;
        $recipes = $repository->findBy(['Category' => 'vegetarian']);
        return $this->render('recipes/vegetarian.html.twig', [
            "recipes" => $recipes
        ]);
    }
}
