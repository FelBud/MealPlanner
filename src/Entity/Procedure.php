<?php

namespace App\Entity;

use App\Repository\ProcedureRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProcedureRepository::class)]
#[ORM\Table(name: '`procedure`')]
class Procedure
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $Instructions = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $Time = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getInstructions(): ?string
    {
        return $this->Instructions;
    }

    public function setInstructions(string $Instructions): self
    {
        $this->Instructions = $Instructions;

        return $this;
    }

    public function getTime(): ?string
    {
        return $this->Time;
    }

    public function setTime(?string $Time): self
    {
        $this->Time = $Time;

        return $this;
    }
}
