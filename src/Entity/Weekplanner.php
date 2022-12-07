<?php

namespace App\Entity;

use App\Repository\WeekplannerRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: WeekplannerRepository::class)]
class Weekplanner
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $date = null;

    #[ORM\Column(length: 255)]
    private ?string $mealTime = null;

    #[ORM\ManyToOne]
    private ?User $fkUser = null;

    #[ORM\ManyToOne]
    private ?Recipes $fkRecipes = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }



    public function getMealTime(): ?string
    {
        return $this->mealTime;
    }

    public function setMealTime(string $mealTime): self
    {
        $this->mealTime = $mealTime;

        return $this;
    }

    public function getFkUser(): ?User
    {
        return $this->fkUser;
    }

    public function setFkUser(?User $fkUser): self
    {
        $this->fkUser = $fkUser;

        return $this;
    }

    public function getFkRecipes(): ?Recipes
    {
        return $this->fkRecipes;
    }

    public function setFkRecipes(?Recipes $fkRecipes): self
    {
        $this->fkRecipes = $fkRecipes;

        return $this;
    }
}
