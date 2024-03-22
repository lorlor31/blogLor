<?php

namespace App\Entity;

use App\Repository\PostRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PostRepository::class)]
class Post
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $title = null;

    #[ORM\ManyToOne(inversedBy: 'posts')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Author $author = null;

    #[ORM\OneToMany(targetEntity: Paragraph::class, mappedBy: 'post', orphanRemoval: true)]
    private Collection $paragraph;

    #[ORM\OneToMany(targetEntity: Code::class, mappedBy: 'post', orphanRemoval: true)]
    private Collection $code;

    #[ORM\ManyToMany(targetEntity: Tag::class, inversedBy: 'posts')]
    private Collection $tag;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $date = null;

    public function __construct()
    {
        $this->paragraph = new ArrayCollection();
        $this->code = new ArrayCollection();
        $this->tag = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getAuthor(): ?Author
    {
        return $this->author;
    }

    public function setAuthor(?Author $author): static
    {
        $this->author = $author;

        return $this;
    }

    /**
     * @return Collection<int, Paragraph>
     */
    public function getParagraph(): Collection
    {
        return $this->paragraph;
    }

    public function addParagraph(Paragraph $paragraph): static
    {
        if (!$this->paragraph->contains($paragraph)) {
            $this->paragraph->add($paragraph);
            $paragraph->setPost($this);
        }

        return $this;
    }

    public function removeParagraph(Paragraph $paragraph): static
    {
        if ($this->paragraph->removeElement($paragraph)) {
            // set the owning side to null (unless already changed)
            if ($paragraph->getPost() === $this) {
                $paragraph->setPost(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Code>
     */
    public function getCode(): Collection
    {
        return $this->code;
    }

    public function addCode(Code $code): static
    {
        if (!$this->code->contains($code)) {
            $this->code->add($code);
            $code->setPost($this);
        }

        return $this;
    }

    public function removeCode(Code $code): static
    {
        if ($this->code->removeElement($code)) {
            // set the owning side to null (unless already changed)
            if ($code->getPost() === $this) {
                $code->setPost(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Tag>
     */
    public function getTag(): Collection
    {
        return $this->tag;
    }

    public function addTag(Tag $tag): static
    {
        if (!$this->tag->contains($tag)) {
            $this->tag->add($tag);
        }

        return $this;
    }

    public function removeTag(Tag $tag): static
    {
        $this->tag->removeElement($tag);

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(?\DateTimeInterface $date): static
    {
        $this->date = $date;

        return $this;
    }
}
