<?php

namespace App\Controller;

use App\Entity\Recipes;
use App\Entity\Weekplanner;
use App\Form\RecipesType;
use App\Repository\RecipesRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\FileUploadError;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\FileUploader;

#[Route('/static')]
class StaticController extends AbstractController
{
    #[Route('/', name: 'app_static')]
    public function index(RecipesRepository $recipesRepository): Response
    {
        return $this->render('recipes/index.html.twig', [
            'recipes' => $recipesRepository->findAll(),
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

    #[Route('/{id}/show', name: 'app_static_show', methods: ['GET'])]
    public function show($id, Recipes $recipe): Response
    {
        // SELECT * 
        // FROM join_recipe
        // WHERE fk_recipes_id = $id

        // SELECT *
        // FROM ingredients
        // WHERE id = join_recipe.id
        return $this->render('recipes/show.html.twig', [
            'recipe' => $recipe,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_recipes_edit_user', methods: ['GET', 'POST'])]
    public function edit(Request $request, Recipes $recipe, RecipesRepository $recipesRepository, FileUploader $fileUploader): Response
    {
        $form = $this->createForm(RecipesType::class, $recipe);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                unlink("pictures/".$recipe->getPicture());
                $pictureFileName = $fileUploader->upload($pictureFile);
                $recipe->setPicture($pictureFileName);
            }else {
                $recipe->setPicture("default.png");
            }
            $recipesRepository->save($recipe, true);

            return $this->redirectToRoute('app_recipes_index', [], Response::HTTP_SEE_OTHER);
        }


        return $this->render('recipes/edit.html.twig', [
            'recipe' => $recipe,
            'form' => $form,
        ]);
    }

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


