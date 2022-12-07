<?php

namespace App\Controller;

use App\Entity\Recipes;
use App\Form\RecipesType;
use App\Repository\RecipesRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class NoAccController extends AbstractController
{
    
    
    #[Route('/no/acc', name: 'app_no_acc')]
    public function index(RecipesRepository $recipesRepository): Response
    {
        
        return $this->render('recipes/index.html.twig', [
            'recipes' => $recipesRepository->findAll(),  
        ]);
    }

    #[Route('/about', name: 'aboutpage')]
    public function about(): Response
    {
        return $this->render('no_acc/about.html.twig', [
            'controller_name' => 'NoAccController',
        ]);
    }

}
