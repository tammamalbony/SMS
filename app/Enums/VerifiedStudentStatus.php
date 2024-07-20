<?php

namespace App\Enums;

use BenSampo\Enum\Enum;
enum VerifiedStudentStatus: string
{
    case PENDING = 'pending';
    case CONFIRMED = 'confirmed';
    case ACTIVE = 'active';
    case DELETED = 'deleted';
    case ESCAPE = 'escape';
    case OUT = 'out';
    case WAITING = 'waiting';
    case GRADUATED = 'graduated';
    case MOVED = 'moved';
    case UPGRADED = 'upgraded';
}
