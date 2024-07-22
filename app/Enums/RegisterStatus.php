<?php

namespace App\Enums;

enum RegisterStatus: string
{
    case Waiting = 'waiting';
    case Normal = 'normal';
    case Pending = 'pending';
    case Graduated = 'graduated';
    case Moved = 'moved';
    case Else = 'else';
}