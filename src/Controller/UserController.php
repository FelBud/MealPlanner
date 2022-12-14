<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Recipes;
use App\Entity\JoinRecipes;
use App\Form\UserType;
use App\Repository\UserRepository;
use App\Repository\RecipesRepository;
use App\Repository\JoinRecipeRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\FileUploader;


#[Route('/admin')]
class UserController extends AbstractController
{
    #[Route('/', name: 'app_dashboard', methods: ['GET'])]
    public function dashboard(UserRepository $usersRepository, RecipesRepository $recipesRepository): Response
    {
        $array = [];
        $user = $usersRepository->findAll();
        foreach ($user as $key => $value) {
            if ($value->getRoles()[0] != "ROLE_ADMIN") {
                array_push($array, $value);
            }
        }

        return $this->render('user/index.html.twig', [
            'users' => $array,
            'recipes' => $recipesRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_user_new', methods: ['GET', 'POST'])]
    public function new(Request $request, UserRepository $userRepository): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $userRepository->save($user, true);

            return $this->redirectToRoute('app_dashboard', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('user/new.html.twig', [
            'user' => $user,
            'form' => $form,
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

    #[Route('/{id}/edit', name: 'app_user_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, User $user, UserRepository $userRepository, FileUploader $fileUploader): Response
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $form->getData();
            $pictureFile = $form->get('picture')->getData();
            if ($pictureFile) {
                if ($user->getPicture() != "userDefault.png" && $user->getPicture() != "adminDefault.png" && $user->getPicture() != Null) {
                    unlink("pictures/" . $user->getPicture());
                }
                $pictureFileName = $fileUploader->upload($pictureFile);
                $user->setPicture($pictureFileName);
            }

            $userRepository->save($user, true);

            return $this->redirectToRoute('app_dashboard', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('user/edit.html.twig', [
            'user' => $user,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_user_delete', methods: ['POST'])]
    public function delete(Request $request, User $user, UserRepository $userRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $user->getId(), $request->request->get('_token'))) {
            $userRepository->remove($user, true);
        }

        return $this->redirectToRoute('app_dashboard', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/block/{id}', name: 'app_user_block')]
    public function block(Request $request, User $user, UserRepository $userRepository, $id): Response
    {
        $user = $userRepository->find($id);
        $user->setRoles(['ROLE_BLOCKED']);
        $userRepository->save($user, true);

        return $this->redirectToRoute('app_dashboard', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/aprove/{id}', name: 'aprove_recipe')]
    public function aprove(Request $request, $id, RecipesRepository $recipesRepository): Response
    {
        $recipe = $recipesRepository->find($id);
        $recipe->setStatus("aproved");
        $recipesRepository->save($recipe, true);

        return $this->redirectToRoute('app_dashboard', [], Response::HTTP_SEE_OTHER);
    }
}
