<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/post', name: 'app_post_')]
class PostController extends AbstractController
{
    #[Route('/list', name: 'list')]
    public function list(): Response
    {
        return $this->render('post/list.html.twig', [
        ]);
    }

    #[Route('/{id<\d+>}', name: 'show')]
    public function gallery(): Response
    {
        return $this->render('post/post.html.twig', [
        ]);
    }
}
