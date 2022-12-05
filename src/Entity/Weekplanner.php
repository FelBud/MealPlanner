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

    #[ORM\OneToMany(mappedBy: 'weekplanner', targetEntity: Recipes::class)]
    private Collection $fkRecipes;

    #[ORM\Column(length: 255)]
    private ?string $mealTime = null;

    public function __construct()
    {
        $this->fkRecipes = new ArrayCollection();
    }

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

    /**
     * @return Collection<int, Recipes>
     */
    public function getFkRecipes(): Collection
    {
        return $this->fkRecipes;
    }

    public function addFkRecipe(Recipes $fkRecipe): self
    {
        if (!$this->fkRecipes->contains($fkRecipe)) {
            $this->fkRecipes->add($fkRecipe);
            $fkRecipe->setWeekplanner($this);
        }

        return $this;
    }

    public function removeFkRecipe(Recipes $fkRecipe): self
    {
        if ($this->fkRecipes->removeElement($fkRecipe)) {
            // set the owning side to null (unless already changed)
            if ($fkRecipe->getWeekplanner() === $this) {
                $fkRecipe->setWeekplanner(null);
            }
        }

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
}
