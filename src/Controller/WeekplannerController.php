<?php

namespace App\Controller;

use App\Entity\Weekplanner;
use App\Form\WeekplannerType;
use App\Form\RecipesType;
use App\Repository\RecipesRepository;
use App\Repository\WeekplannerRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/weekplanner')]
class WeekplannerController extends AbstractController
{
    #[Route('/', name: 'app_weekplanner_index', methods: ['GET', 'POST'])]
    public function index(WeekplannerRepository $weekplannerRepository): Response
    {
        // dd($weekplannerRepository->findBy(["fkUser"=>$this->getUser()]));
        return $this->render('weekplanner/index.html.twig', [
            'weekplanners' => $weekplannerRepository->findBy(["fkUser"=>$this->getUser()])
        ]);
    }

    #[Route('/{id}/new', name: 'app_weekplanner_new', methods: ['GET', 'POST'])]
    public function new(Request $request, WeekplannerRepository $weekplannerRepository, $id, RecipesRepository $recipeRepository): Response
    {
        $weekplanner = new Weekplanner();

        $form = $this->createForm(WeekplannerType::class, $weekplanner);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $recipe=$recipeRepository->find($id);
            $weekplanner->setFkRecipes($recipe);
            $weekplanner->setFkUser($this->getUser());
            $date=new \DateTime("now");
            $weekplanner->setDate($date);
            $weekplannerRepository->save($weekplanner, true);
    
            return $this->redirectToRoute("app_weekplanner_index");
        }

        return $this->renderForm('weekplanner/new.html.twig', [
            'weekplanner' => $weekplanner,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_weekplanner_show', methods: ['GET'])]
    public function show(Weekplanner $weekplanner): Response
    {
        return $this->render('weekplanner/show.html.twig', [
            'weekplanner' => $weekplanner,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_weekplanner_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Weekplanner $weekplanner, WeekplannerRepository $weekplannerRepository): Response
    {
        $form = $this->createForm(WeekplannerType::class, $weekplanner);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $weekplannerRepository->save($weekplanner, true);

            return $this->redirectToRoute('app_weekplanner_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('weekplanner/edit.html.twig', [
            'weekplanner' => $weekplanner,
            'form' => $form,
        ]);
    }

    #[Route('/{id}/delete', name: 'app_weekplanner_delete')]
    public function delete($id, Request $request, WeekplannerRepository $weekplannerRepository): Response
    {
        $weekplanner=$weekplannerRepository->find($id);
        // dd($weekplanner);
            $weekplannerRepository->remove($weekplanner, true);

        return $this->redirectToRoute('app_weekplanner_index', [], Response::HTTP_SEE_OTHER);
    }
}
