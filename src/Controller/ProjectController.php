<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/project', name: 'app_project_')]
class ProjectController extends AbstractController
{
    #[Route('/list', name: 'list')]
    public function list(): Response
    {
        return $this->render('project/list.html.twig', [
        ]);
    }

    #[Route('/{id<\d+>}', name: 'show')]
    public function gallery(): Response
    {
        return $this->render('project/project.html.twig', [
        ]);
    }
}