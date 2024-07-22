function NumToText(str) {
    var input = str.toString()
    var charCount = input.toString().length;
    var splits = input.toString().split('')

    if (charCount < 3) {
        return nums[input]
    } else if (charCount == 3) {
        if (input == 100) {
            return nums[100];
        }
        var hunds = hun[splits[0]]
        if (splits[1] == "0" && splits[2] == "0") {
            return hunds;
        }
        if (splits[1] == "0") {
            return hunds + " و " + nums[splits[2]]
        }
        return hunds + " و " + nums[splits[1] + "" + splits[2]]
    } else if (charCount == 4) {
        var th = thous[splits[0]]
        if (splits[1] != "0") {

            if (splits[1] == 1 && splits[2] == 0 && splits[3] == 0) {
                return th + " و " + nums[100];
            }
            var hunds = hun[splits[1]]
            if (splits[2] == "0" && splits[3] == "0") {
                return th + " و " + hunds;
            }
            if (splits[2] == "0") {
                return th + " و " + hunds + " و " + nums[splits[3]]
            }
            return th + " و " + hunds + " و " + nums[splits[2] + "" + splits[3]]
        }
        if (splits[2] == "0" && splits[3] == "0") {
            return th
        }
        if (splits[2] == "0") {
            return th + " و " + nums[splits[3]]
        }
        return th + " و " + nums[splits[2] + "" + splits[3]]
    } else {
        console.log("Number Not Found Split : " + input);
    }

}

function containsNumbers(inputString) {
    var regex = /\d/;
    return regex.test(inputString);
}

function replaceEnglishWithArabic(inputString) {
    var englishNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    var arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    if (inputString) {
        for (let i = 0; i < englishNumbers.length; i++) {
            // console.log(inputString);
            var regex = new RegExp(englishNumbers[i], 'g');
            inputString = inputString.toString().replace(regex, arabicNumbers[i]);
        }
    }
    return inputString;
}

function replaceArabicWithEnglish(inputString) {
    var englishNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    var arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    if (inputString) {
        for (let i = 0; i < englishNumbers.length; i++) {
            // console.log(inputString);
            var regex = new RegExp(arabicNumbers[i], 'g');
            inputString = inputString.replace(regex, englishNumbers[i]);
        }
    }
    return inputString;
}

function setArabicNumerals() {
    document.documentElement.lang = 'ar';
    document.body.style.fontFamily = "'ArabicFont', sans-serif"; /* Replace 'ArabicFont' with your preferred Arabic font */
    document.body.style.fontFeatureSettings = "'tnum' on"; /* Enable tabular numerals (Arabic numerals) */
}

function setWesternNumerals() {
    document.documentElement.lang = 'en';
    document.body.style.fontFamily = "'Arial', sans-serif"; /* Reset to default font-family for Western numerals */
    document.body.style.fontFeatureSettings = "'tnum' off"; /* Disable tabular numerals (Western numerals) */
}
var nums = {
    1: "واحد",
    2: "اثنين",
    3: "ثلاثة",
    4: "أربعة",
    5: "خمسة",
    6: "ستة",
    7: "سبعة",
    8: "ثمانية",
    9: "تسعة",
    10: "عشرة",
    11: "أحد عشر",
    12: "اثني عشر",
    13: "ثلاثة عشر",
    14: "أربعة عشر",
    15: "خمسة عشر",
    16: "ستة عشر",
    17: "سبعة عشر",
    18: "ثمانية عشر",
    19: "تسعة عشر",
    20: "عشرون",
    21: "واحد وعشرون",
    22: "اثنان وعشرون",
    23: "ثلاثة وعشرون",
    24: "أربعة وعشرون",
    25: "خمسة وعشرون",
    26: "ستة وعشرون",
    27: "سبعة وعشرون",
    28: "ثمانية وعشرون",
    29: "تسعة وعشرون",
    30: "ثلاثون",
    31: "واحد وثلاثون",
    32: "اثنان وثلاثون",
    33: "ثلاثة وثلاثون",
    34: "أربعة وثلاثون",
    35: "خمسة وثلاثون",
    36: "ستة وثلاثون",
    37: "سبعة وثلاثون",
    38: "ثمانية وثلاثون",
    39: "تسعة وثلاثون",
    40: "أربعون",
    41: "واحد وأربعون",
    42: "اثنان وأربعون",
    43: "ثلاثة وأربعون",
    44: "أربعة وأربعون",
    45: "خمسة وأربعون",
    46: "ستة وأربعون",
    47: "سبعة وأربعون",
    48: "ثمانية وأربعون",
    49: "تسعة وأربعون",
    50: "خمسون",
    51: "واحد وخمسون",
    52: "اثنان وخمسون",
    53: "ثلاثة وخمسون",
    54: "أربعة وخمسون",
    55: "خمسة وخمسون",
    56: "ستة وخمسون",
    57: "سبعة وخمسون",
    58: "ثمانية وخمسون",
    59: "تسعة وخمسون",
    60: "ستون",
    61: "واحد وستون",
    62: "اثنان وستون",
    63: "ثلاثة وستون",
    64: "أربعة وستون",
    65: "خمسة وستون",
    66: "ستة وستون",
    67: "سبعة وستون",
    68: "ثمانية وستون",
    69: "تسعة وستون",
    70: "سبعون",
    71: "واحد وسبعون",
    72: "اثنان وسبعون",
    73: "ثلاثة وسبعون",
    74: "أربعة وسبعون",
    75: "خمسة وسبعون",
    76: "ستة وسبعون",
    77: "سبعة وسبعون",
    78: "ثمانية وسبعون",
    79: "تسعة وسبعون",
    80: "ثمانون",
    81: "واحد وثمانون",
    82: "اثنان وثمانون",
    83: "ثلاثة وثمانون",
    84: "أربعة وثمانون",
    85: "خمسة وثمانون",
    86: "ستة وثمانون",
    87: "سبعة وثمانون",
    88: "ثمانية وثمانون",
    89: "تسعة وثمانون",
    90: "تسعون",
    91: "واحد وتسعون",
    92: "اثنان وتسعون",
    93: "ثلاثة وتسعون",
    94: "أربعة وتسعون",
    95: "خمسة وتسعون",
    96: "ستة وتسعون",
    97: "سبعة وتسعون",
    98: "ثمانية وتسعون",
    99: "تسعة وتسعون",
    100: "مئة"
}

var hun = {
    1: "مائة",
    2: "مئتان",
    3: "ثلاثمائة",
    4: "أربعمائة",
    5: "خمسمائة",
    6: "ستمائة",
    7: "سبعمائة",
    8: "ثمانمائة",
    9: "تسعمائة"
}
var thous = {
    1: "ألف",
    2: "ألفان",
    3: "ثلاثة آلاف",
    4: "أربعة آلاف",
    5: "خمسة آلاف"
}


// for (let j = 0; j < 3010; j++) {
//     console.log(j + "  >>> " + NumToText(j));

// }