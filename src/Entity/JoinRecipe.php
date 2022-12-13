<?php

namespace App\Entity;

use App\Repository\JoinRecipeRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: JoinRecipeRepository::class)]
class JoinRecipe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Recipes $fkRecipes = null;

    #[ORM\ManyToOne(inversedBy: 'joinRecipes')]
    #[ORM\JoinColumn(nullable: false)]
    public ?Ingredients $fkIngredients = null;

    public function getId(): ?int
    {
        return $this->id;
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

    public function getFkIngredients(): ?Ingredients
    {
        return $this->fkIngredients;
    }

    public function setFkIngredients(?Ingredients $fkIngredients): self
    {
        $this->fkIngredients = $fkIngredients;

        return $this;
    }
}
