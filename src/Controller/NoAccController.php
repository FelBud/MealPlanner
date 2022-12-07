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
    public function index(): Response
    {

        return $this->render('no_acc/index.html.twig', []);
    }

    #[Route('/about', name: 'about')]
    public function about(): Response
    {

        return $this->render('components/about.html.twig', []);
    }
}
