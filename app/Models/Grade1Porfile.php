<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grade1Porfile extends Model
{
    private $studentInfo;
    private $term1Results;
    private $term2Results;
    private $finalResults;
    private $attendanceInfo;
    private $schoolInfo;
    private $adminInfo;
    private $resultsInfo;
    private $notes;

    public function __construct($studentInfo, $term1Results, $term2Results, $finalResults, $attendanceInfo, $schoolInfo, $adminInfo, $resultsInfo, $notes)
    {
        $this->studentInfo = $studentInfo;
        $this->term1Results = $term1Results;
        $this->term2Results = $term2Results;
        $this->finalResults = $finalResults;
        $this->attendanceInfo = $attendanceInfo;
        $this->schoolInfo = $schoolInfo;
        $this->adminInfo = $adminInfo;
        $this->resultsInfo = $resultsInfo;
        $this->notes = $notes;
    }

    // Getters
    public function getStudentInfo()
    {
        return $this->studentInfo;
    }

    public function getTerm1Results()
    {
        return $this->term1Results;
    }

    public function getTerm2Results()
    {
        return $this->term2Results;
    }

    public function getFinalResults()
    {
        return $this->finalResults;
    }

    public function getAttendanceInfo()
    {
        return $this->attendanceInfo;
    }

    public function getSchoolInfo()
    {
        return $this->schoolInfo;
    }

    public function getAdminInfo()
    {
        return $this->adminInfo;
    }

    public function getResultsInfo()
    {
        return $this->resultsInfo;
    }

    public function getNotes()
    {
        return $this->notes;
    }

    // Setters
    public function setStudentInfo($studentInfo)
    {
        $this->studentInfo = $studentInfo;
    }

    public function setTerm1Results($term1Results)
    {
        $this->term1Results = $term1Results;
    }

    public function setTerm2Results($term2Results)
    {
        $this->term2Results = $term2Results;
    }

    public function setFinalResults($finalResults)
    {
        $this->finalResults = $finalResults;
    }

    public function setAttendanceInfo($attendanceInfo)
    {
        $this->attendanceInfo = $attendanceInfo;
    }

    public function setSchoolInfo($schoolInfo)
    {
        $this->schoolInfo = $schoolInfo;
    }

    public function setAdminInfo($adminInfo)
    {
        $this->adminInfo = $adminInfo;
    }

    public function setResultsInfo($resultsInfo)
    {
        $this->resultsInfo = $resultsInfo;
    }

    public function setNotes($notes)
    {
        $this->notes = $notes;
    }
}
