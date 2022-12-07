<?php

namespace App\Entity;

use App\Repository\RecipesRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RecipesRepository::class)]
class Recipes
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $Name = null;

    #[ORM\Column(length: 255)]
    private ?string $Picture = null;

    #[ORM\Column(length: 255)]
    private ?string $Category = null;

    #[ORM\Column]
    private ?int $Servings = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 5, scale: 2)]
    private ?string $Price = null;

    #[ORM\Column(length: 255)]
    private ?string $Time = null;


    #[ORM\OneToOne(cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    private ?Procedure $fkProcedure = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->Name;
    }

    public function setName(string $Name): self
    {
        $this->Name = $Name;

        return $this;
    }

    public function getPicture(): ?string
    {
        return $this->Picture;
    }

    public function setPicture(string $Picture = null): self
    {
        $this->Picture = $Picture;

        return $this;
    }

    public function getCategory(): ?string
    {
        return $this->Category;
    }

    public function setCategory(string $Category): self
    {
        $this->Category = $Category;

        return $this;
    }

    public function getServings(): ?int
    {
        return $this->Servings;
    }

    public function setServings(int $Servings): self
    {
        $this->Servings = $Servings;

        return $this;
    }

    public function getPrice(): ?string
    {
        return $this->Price;
    }

    public function setPrice(string $Price): self
    {
        $this->Price = $Price;

        return $this;
    }

    public function getTime(): ?string
    {
        return $this->Time;
    }

    public function setTime(string $Time): self
    {
        $this->Time = $Time;

        return $this;
    }



    public function getFkProcedure(): ?Procedure
    {
        return $this->fkProcedure;
    }

    public function setFkProcedure(Procedure $fkProcedure): self
    {
        $this->fkProcedure = $fkProcedure;

        return $this;
    }
}
