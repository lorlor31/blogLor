<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/', name: 'app_')]
class MainController extends AbstractController
{
    #[Route('/', name: 'main')]
    public function home(): Response
    {
        return $this->render('main/home.html.twig', [
        ]);
    }

    #[Route('/galerie', name: 'gallery')]
    public function gallery(): Response
    {
        return $this->render('main/gallery.html.twig', [
        ]);
    }
}
