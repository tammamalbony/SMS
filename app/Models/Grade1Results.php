<?php

namespace App\Models;

use App\Models\Grade1Porfile;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grade1Results extends Model
{
    function Getbystudent($verifiedStudent) : Grade1Porfile {


        $studentInfo = [
            'FatherName' => $verifiedStudent->student->father->name,
            'MotherName' => $verifiedStudent->student->mother->name,
            'Grade' => $verifiedStudent->section->classsSchoolYear->classs->class_name_ar,
            'Section' => $verifiedStudent->section->name,
            'SerialNumber' => $verifiedStudent->order,
            'DayOfBirth' => Carbon::parse($verifiedStudent->student->birthdate)->day,
            'YearOfBirth' =>  Carbon::parse($verifiedStudent->student->birthdate)->year,
            'MonthOfBirth' => Carbon::parse($verifiedStudent->student->birthdate)->month,
            'GeneralRecord' => '1',
            'StudentName' => $verifiedStudent->student->name_ar . " " .$verifiedStudent->student->father->last_name,
            'ForeignLanguage' => $verifiedStudent->section->languages
        ];


        $term1Results = [];
        $term2Results = [];

        
        $resultTirm1= $verifiedStudent->examResults;

        $term1Results = [
            // 'M1' => '0',
            // 'M2' => '0',
            // 'M3' => '0',
            // 'M4' => '0',
            // 'M5' => '0',
            // 'M6' => '0',
            // 'M7' => '0',
            // 'M8' => '0',
            // 'M9' => '0',
            // 'M10' => '0',
            // 'M11' => '0',
            // 'M12' => '0',
            // 'M13' => '0',
            // 'M14' => '0'
        ];
        $term2Results = [
            // 'MM1' => '0',
            // 'MM2' => '0',
            // 'MM3' => '0',
            // 'MM4' => '0',
            // 'MM5' => '0',
            // 'MM6' => '0',
            // 'MM7' => '0',
            // 'MM8' => '0',
            // 'MM9' => '0',
            // 'MM10' => '0',
            // 'MM11' => '0',
            // 'MM12' => '0',
            // 'MM13' => '0',
            // 'MM14' => '0'
        ];
        foreach($resultTirm1 as $Tirm1result){
            if($Tirm1result->subjectDetail != null){
                $subjectname = $Tirm1result->subjectDetail->subject->name_ar;
                // dd( $subjectname );
                // $subjectkey = getSubjectKey1( $subjectname);
                if($Tirm1result->exam->term->id == 1){
                    $term1Results[$subjectname] =$Tirm1result->value;
                }else{
                    $term2Results[$subjectname] =$Tirm1result->value;
                }
            }
            
        }
        $finalResults = [
            // 'MMM1' => 'ممتاز',
            // 'MMM2' => 'ممتاز',
            // 'MMM3' => 'ممتاز',
            // 'MMM4' => 'ممتاز',
            // 'MMM5' => 'ممتاز',
            // 'MMM6' => 'ممتاز',
            // 'MMM7' => 'ممتاز',
            // 'MMM8' => 'ممتاز',
            // 'MMM9' => 'ممتاز',
            // 'MMM10' => 'ممتاز',
            // 'MMM11' => 'ممتاز',
            // 'MMM12' => 'ممتاز',
            // 'MMM13' => 'ممتاز',
            // 'MMM14' => 'ممتاز'
        ];
        foreach ($term1Results as $key => $value) {
            $finalResults[$key] =  MarkReview::getByMark(($term1Results[$key] + $term2Results[$key])/2)->result ." >>> ".(($term1Results[$key] + $term2Results[$key])/2)." >>>> done";
        }
      

        dd($studentInfo,  $term1Results ,$term2Results ,   $finalResults);
  
   

        

        $attendanceInfo = [
            'MainDaiesTirm1' => '87',
            'MainDaiesTirm2' => '87',
            'MainDaiesAll' => '87',
            'StudenOnDaiesTirm1' => '87',
            'StudenOnDaiesTirm2' => '87',
            'StudenOnDaiesAll' => '87',
            'StudenOffDaiesTirm1' => '87',
            'StudenOffDaiesTirm2' => '87',
            'StudenOffDaiesAll' => '87',
            'StudenWhyDaiesTirm1' => '87',
            'StudenWhyDaiesTirm2' => '87',
            'StudenWhyDaiesAll' => '87'
        ];

        $schoolInfo = [
            'SchoolName' => 'مدرسة الشام الدولية الافتراضية',
            'Gove' => 'السويداء',
            'YearStart' => '23',
            'YearEnd' => '24'
        ];

        $adminInfo = [
            'MangerNote' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet',
            'MangerName' => 'Lorem ipsum',
            'DayOfSign' => '13',
            'YearOfSign' => '15',
            'MonthOfSign' => '02',
            'TeacherName' => 'Lorem ipsum'
        ];

        $resultsInfo = [
            'SuccessResult' => 'Lorem ipsum',
            'FailResult' => 'Lorem ipsum',
            'MoveResult' => 'Lorem ipsum',
            'TransResult' => 'Lorem ipsum'
        ];

        $notes = [
            'Note1' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
            'Note2' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
            'Note3' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed',
            'Note4' => 'Lorem ipsum dolor sit amet',
            'Note5' => 'Lorem ipsum dolor sit amet',
            'Note6' => 'Lorem ipsum dolor sit amet',
            'Note7' => 'Lorem ipsum dolor sit amet',
            'Note8' => 'Lorem ipsum dolor sit amet',
            'Note9' => 'Lorem ipsum dolor sit amet'
        ];

        return new Grade1Porfile(
            $studentInfo,
            $term1Results,
            $term2Results,
            $finalResults,
            $attendanceInfo,
            $schoolInfo,
            $adminInfo,
            $resultsInfo,
            $notes
        );
    }
}
