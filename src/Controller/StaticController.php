<?php

namespace App\Controller;

use App\Entity\Ingredients;
use App\Entity\JoinRecipe;
use App\Entity\User;
use App\Entity\Recipes;
use App\Entity\Weekplanner;
use App\Form\RecipesType;
use App\Form\IngredientsType;
use App\Repository\RecipesRepository;
use App\Repository\JoinRecipeRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\FileUploadError;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\FileUploader;
use Doctrine\Persistence\ManagerRegistry;

#[Route('/static')]
class StaticController extends AbstractController
{
    #[Route('/', name: 'app_static')]
    public function index(RecipesRepository $recipesRepository): Response
    {
        $fkUser = $this->getUser();
        return $this->render('components/dashboard.html.twig', [
            'recipes' => $recipesRepository->findBy(["fkUser" => $this->getUser()]),
            'user' => $fkUser,
        ]);
    }

    #[Route('/new', name: 'app_recipes_new_user', methods: ['GET', 'POST'])]
    public function new(Request $request, RecipesRepository $recipesRepository, FileUploader $fileUploader): Response
    {
        $recipe = new Recipes();
        $form = $this->createForm(RecipesType::class, $recipe);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                $pictureFileName = $fileUploader->upload($pictureFile);
                $recipe->setPicture($pictureFileName);
            } else {
                $recipe->setPicture("default.png");
            }
            $recipesRepository->save($recipe, true);

            return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('recipes/new.html.twig', [
            'recipe' => $recipe,
            'form' => $form,
        ]);
    }

    #[Route('/{id}/show', name: 'app_recipes_user_show', methods: ['GET'])]
    public function show($id, RecipesRepository $recipesRepository, JoinRecipeRepository $JoinRecipeRepository): Response
    {
        $recipes = $recipesRepository->find($id);
        $joinRecipe = $JoinRecipeRepository->findBy(array("fkRecipes"=> $id));
        

        return $this->render('recipes/show.html.twig', [
            'recipe' => $recipes,
            'joinRecipe' => $joinRecipe,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_dashboard_edit', methods: ['GET', 'POST'])]
    public function dashboard($id, ManagerRegistry $doctrine, Request $request, Recipes $recipe, RecipesRepository $recipesRepository, FileUploader $fileUploader): Response
    {
       
        if($this->getUser() == $recipe->getFkUser()){
            
        $ings = $doctrine->getRepository(JoinRecipe::class)->findBy(array("fkRecipes"=>$id));
        $string = "";

        foreach($ings as $ing){
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
            $ingredients = explode(", ", $ingredients );
            
            foreach($ingredients as $ingredient){
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
            "form2"=> $form2->createView(),
        
        ]);
    }else{
        return $this->redirectToRoute('app_static');
    }
    }

    // #[Route('/{id}/edit', name: 'app_recipes_edit_user', methods: ['GET', 'POST'])]
    // public function edit(Request $request, Recipes $recipe, RecipesRepository $recipesRepository, FileUploader $fileUploader): Response
    // {
    //     $form = $this->createForm(RecipesType::class, $recipe);
    //     $form->handleRequest($request);

    //     if($form->isSubmitted() && $form->isValid()) {
    //         $pictureFile = $form->get('picture')->getData();
    //         if ($pictureFile) {
    //             unlink("pictures/".$recipe->getPicture());
    //             $pictureFileName = $fileUploader->upload($pictureFile);
    //             $recipe->setPicture($pictureFileName);
    //         }else {
    //             $recipe->setPicture("default.png");
    //         }
    //         $recipesRepository->save($recipe, true);

    //         return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
    //     }


    //     return $this->render('recipes/edit.html.twig', [
    //         'recipe' => $recipe,
    //         'form' => $form,
    //     ]);
    // }

    #[Route('/{id}', name: 'app_recipes_delete_user', methods: ['POST'])]
    public function delete(Request $request, Recipes $recipe, RecipesRepository $recipesRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$recipe->getId(), $request->request->get('_token'))) {
            $recipesRepository->remove($recipe, true);
        }

        return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/add/{id}', name: 'app_static_add')]
    public function add(RecipesRepository $recipesRepository): Response
    {
        $weekP = new Weekplanner();
        $form = $this->createForm(RecipesType::class, $weekP);
        // $form->handleRequest($request);

        return $this->render('recipes/add.html.twig', [
            'recipes' => $recipesRepository->findAll(),
        ]);
    }

}


