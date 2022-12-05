<?php

namespace App\Entity;

use App\Repository\IngredientsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: IngredientsRepository::class)]
class Ingredients
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $Name = null;

    #[ORM\OneToMany(mappedBy: 'fkIngredients', targetEntity: JoinRecipe::class)]
    private Collection $joinRecipes;

    public function __construct()
    {
        $this->joinRecipes = new ArrayCollection();
    }

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

    /**
     * @return Collection<int, JoinRecipe>
     */
    public function getJoinRecipes(): Collection
    {
        return $this->joinRecipes;
    }

    public function addJoinRecipe(JoinRecipe $joinRecipe): self
    {
        if (!$this->joinRecipes->contains($joinRecipe)) {
            $this->joinRecipes->add($joinRecipe);
            $joinRecipe->setFkIngredients($this);
        }

        return $this;
    }

    public function removeJoinRecipe(JoinRecipe $joinRecipe): self
    {
        if ($this->joinRecipes->removeElement($joinRecipe)) {
            // set the owning side to null (unless already changed)
            if ($joinRecipe->getFkIngredients() === $this) {
                $joinRecipe->setFkIngredients(null);
            }
        }

        return $this;
    }
}
