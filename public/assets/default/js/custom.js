(function ($) {
    "use strict";
    document.addEventListener("DOMContentLoaded", function () {


        const dropdownToggles = document.querySelectorAll('.high-priority-main .high-priority-toggler');
        dropdownToggles.forEach(toggle => {
            toggle.addEventListener('click', function () {
                const dropdownMenu = this.nextElementSibling;
                const vipOverlay = this.parentNode.querySelector('.vip_overlay');
                if (!dropdownMenu.classList.contains('show')) {
                    try {
                        openDropdown(dropdownMenu, this, vipOverlay);
                    } catch (error) {
                        console.error("Error opening dropdown:", error);
                    }
                } else {
                    try {
                        closeAll()
                    } catch (error) {
                        console.error("Error closing dropdown:", error);
                    }
                }
                const togglerNode = dropdownMenu.parentNode;
                const toggler = togglerNode.parentNode;
                toggler.scrollIntoView({
                    behavior: 'smooth',
                    block: 'end'
                });
            });
        });

        document.querySelectorAll('.vip_overlay').forEach(function (element) {
            element.addEventListener('click', function () {
                closeAll();
            });
        });

        function openDropdown(dropdownMenu, toggle, vipOverlay) {
            closeAll();
            dropdownMenu.classList.add('show');
            toggle.classList.add('active');
            const button = toggle.closest('.high-priority-toggler');
            const buttonHeight = button.offsetHeight;
            // const menuHeight = dropdownMenu.offsetHeight;
            // const buttonPosition = button.getBoundingClientRect();
            // const distanceToBottom = window.innerHeight - buttonPosition.bottom;

            // Adjust menu position based on available space
            // if (distanceToBottom > menuHeight) {
            //     dropdownMenu.style.top = buttonHeight + 'px';
            //     dropdownMenu.style.bottom = 'auto';
            // } else {
            dropdownMenu.style.bottom = buttonHeight + 'px';
            dropdownMenu.style.top = 'auto';
            // }
            if (vipOverlay) {
                vipOverlay.style.display = 'block';
            }
        }

        function closeAll() {
            document.querySelectorAll('.vip_overlay').forEach(vipOverlay => {
                vipOverlay.style.display = 'none';
            });
            document.querySelectorAll('.high-priority-menu').forEach(dropdownMenu => {
                dropdownMenu.classList.remove('show');
            });
            document.querySelectorAll('.high-priority-toggler').forEach(toggle => {
                toggle.classList.remove('active');
            });
        }

        setTimeout(() => {
            let homesections = document.querySelectorAll('.home-sections');
            if (homesections) {
                homesections.forEach(function (section) {
                    var pagination = section.querySelector('.custom-postion-pagenation');
                    if (pagination) {
                        var bullets = pagination.querySelectorAll('.swiper-pagination-bullet');
                        var parentDiv = pagination.parentNode;
                        if (bullets.length > 1) {
                            parentDiv.style.visibility = 'visible';
                        } else {
                            if (!parentDiv.classList.contains('hf') && !parentDiv.classList.contains('rf') && !parentDiv.classList.contains('keepshow')) {
                                parentDiv.style.visibility = 'hidden';
                                parentDiv.style.display = 'none';
                            }
                        }
                    }
                });
            }


            const swipers = document.querySelectorAll('.swiper-container');
            if (swipers) {

                swipers.forEach(swiper => {
                    const bullets = swiper.querySelectorAll('.custom-postion-pagenation .swiper-pagination-bullet');
                    const prevButton = swiper.querySelector('.swiper-button-prev');
                    const nextButton = swiper.querySelector('.swiper-button-next');

                    if (prevButton && bullets && nextButton) {
                        prevButton.classList.add('swiper-button-disabled');
                        prevButton.setAttribute('aria-disabled', 'true');
                        bullets.forEach(bullet => {
                            bullet.addEventListener('click', function () {
                                // Enable/disable previous and next buttons based on active bullet
                                const activeIndex = Array.from(bullets).indexOf(this);
                                if (activeIndex === 0) {
                                    prevButton.classList.add('swiper-button-disabled');
                                    prevButton.setAttribute('aria-disabled', 'true');
                                    nextButton.classList.remove('swiper-button-disabled');
                                    nextButton.setAttribute('aria-disabled', 'false');
                                } else if (activeIndex === bullets.length - 1) {
                                    nextButton.classList.add('swiper-button-disabled');
                                    nextButton.setAttribute('aria-disabled', 'true');
                                    prevButton.classList.remove('swiper-button-disabled');
                                    prevButton.setAttribute('aria-disabled', 'false');
                                } else {
                                    prevButton.classList.remove('swiper-button-disabled');
                                    prevButton.setAttribute('aria-disabled', 'false');
                                    nextButton.classList.remove('swiper-button-disabled');
                                    nextButton.setAttribute('aria-disabled', 'false');
                                }
                            });
                        });
                    }
                });
            }

        }, 500);


    });
})(jQuery);

// window.onload = function() {
//     var images = document.getElementsByTagName('img');
//     for (var i = 0; i < images.length; i++) {
//         var src = images[i].getAttribute('src');
//         var newSrc = src.replace('http://127.0.0.1:8000', '');
//         images[i].setAttribute('src', newSrc);
//     }
// };

var sectionParameters = {
    'horizontal-latest_classes-section-dyn': {
        route: '/getswiper',
        type: 'latest_classes',
        isVertical: false
    },
    'horizontal-best_sellers-section-dyn': {
        route: '/getswiper',
        type: 'best_sellers',
        isVertical: false
    },
    'horizontal-best_rates-section-dyn': {
        route: '/getswiper',
        type: 'best_rates',
        isVertical: false
    }
};


function executeFetchIfSectionExists() {
    for (var sectionClass in sectionParameters) {
        var sectionExists = document.querySelector('.' + sectionClass);
        if (sectionExists) {
            var parameters = sectionParameters[sectionClass];
            fetchDataAndDisplayContent(
                parameters.route,
                sectionClass,
                parameters.type,
                parameters.isVertical
            );
        }
    }
}

function fetchDataAndDisplayContent(route, className, type, isVertical) {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content'); // Assuming CSRF token is stored in a meta tag
    console.log("route : " + route + " || className : " + className + " || type : " + type + " || isVertical : " + isVertical + " || csrfToken : " + csrfToken);
    fetch(route, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': csrfToken
            },
            body: JSON.stringify({
                type: type,
                isVertical: isVertical
            }),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok so can\'t get the swiper ....');
            }
            return response.text()
        })
        .then(data => {
            var element = document.querySelector('.' + className);
            if (element) {
                element.innerHTML = data;
                const swiperDirection = isVertical ? 'vertical' : 'horizontal';
                initializeSwiper('.' + type + '-swiper', swiperDirection);
            } else {
                console.error('Element with class ' + className + ' not found');
            }
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
}


function initializeSwiper(selector, direction) {
    console.log("Next : " + selector + '-Next' + "   ||  Prev : " + selector + '-Prev')
    new Swiper(selector, {
        direction: direction,
        slidesPerView: 3,
        spaceBetween: 30,
        pagination: {
            el: selector + '-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: selector + '-Next',
            prevEl: selector + '-Prev',
        },
        breakpoints: {
            1200: {
                slidesPerView: 3,
            },
            991: {
                slidesPerView: 3,
            },
            660: {
                slidesPerView: 2,
            },
        }
    });
}

function focused(e) {
    e.parentElement.classList.contains("input-group") && e.parentElement.classList.add("focused")
}

function defocused(e) {
    e.parentElement.classList.contains("input-group") && e.parentElement.classList.remove("focused")
}

$(function () {
    $('form').on('submit', function (event) {
        var formID = $(this).attr('id');
        if (formID) {
            console.log('Form ID:', formID);
        } else {
            var formClasses = $(this).attr('class');
            console.log('Form Classes:', formClasses);
        }
        event.preventDefault();
        $(this).find(':input').each(function () {
            var inputValue = $(this).val();
            if (typeof inputValue === 'string' && inputValue.match(/<[^>]*>/)) {
                var encodedValue = btoa(encodeURIComponent(inputValue));
                var encodedValueWithPrefixSuffix = "btoa64_" + encodedValue + "_btoa64";
                $(this).val(encodedValueWithPrefixSuffix);
            }
        });
        this.submit();
    });

  
});
document.addEventListener('keydown', function (event) {
    if (event.key === 'Enter') {
        if (event.target.tagName.toLowerCase() === 'input' && !event.target.closest('.bootstrap-tagsinput')) {
            console.log(event.target.classList);
            event.preventDefault();
        }
    }
});
// function setCookie(name, value, days) {
//     var expires = "";
//     if (days) {
//         var date = new Date();
//         date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
//         expires = "; expires=" + date.toUTCString();
//     }
//     document.cookie = `${name}=${encodeURIComponent(value || "")}${expires}; path=/`;
// }
// function getCookie(name) {
//     var nameEQ = name + "=";
//     var ca = document.cookie.split(';');
//     for (var i = 0; i < ca.length; i++) {
//         var c = ca[i].trim();
//         if (c.indexOf(nameEQ) === 0) return decodeURIComponent(c.substring(nameEQ.length, c.length));
//     }
//     return null;
// }
// function setRedirectCookie(url, days) {
//     setCookie("redirectUrl", url, days);
// }
// function redirectToStoredUrl(defaultUrl) {
//     var redirectUrl = getCookie("redirectUrl");
//     if (redirectUrl) {
//         setCookie("redirectUrl", "", -1);
//         window.location.href = redirectUrl;
//     } else {
//         // window.location.href = defaultUrl;
//     }
// }
// document.addEventListener("DOMContentLoaded", function() {
//     redirectToStoredUrl("/");
// });

function isSmallScreen() {
    return window.innerWidth <= 768; 
}

function closeAccordionOnSmallScreen() {
    if (isSmallScreen()) {
        var typeFilterCollapse = document.getElementById('typeFilterCollapse');
        var categoryFilterCollapse = document.getElementById('categoryFilterCollapse');
        if (typeFilterCollapse && typeFilterCollapse.classList.contains('show')) {
            $('#typeFilterCollapse').collapse('hide');
        }
        if (categoryFilterCollapse && categoryFilterCollapse.classList.contains('show')) {
            $('#categoryFilterCollapse').collapse('hide');
        }
    }
}

window.addEventListener('load', closeAccordionOnSmallScreen);
window.addEventListener('resize', closeAccordionOnSmallScreen);
