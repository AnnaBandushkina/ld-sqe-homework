Meta:
@UI
@EPAM

Narrative:
As a user
I want to validate EPAM website UI functionality
So that I can ensure the site is working properly in Chrome

Scenario: Check the title is correct
When I open URL `https://www.epam.com` in new tab
When I wait until page title matches `EPAM \| Software Engineering & Product Development Services`
Then page title is equal to `EPAM | Software Engineering & Product Development Services`

Scenario: Check the ability to toggle between Dark and Light modes
When I open URL `https://www.epam.com` in new tab
When I wait until element located by `cssSelector(.theme-switcher)` appears
When I click on element located by `cssSelector(.theme-switcher)`
When I wait until element located by `cssSelector(body.dark-mode)` disappears
When I click on element located by `cssSelector(.theme-switcher)`
When I wait until element located by `cssSelector(body.dark-mode)` appears
When I wait until element located by `cssSelector(body.dark-mode)` appears

Scenario: Check that allow to change language to UA
When I open URL `https://www.epam.com` in new tab
When I wait until element located by `cssSelector(span.location-selector__button-language)` appears
When I click on element located by `cssSelector(span.location-selector__button-language)`
When I wait until element located by `cssSelector(a.location-selector__link[lang='uk'])` appears
When I click on element located by `cssSelector(a.location-selector__link[lang='uk'])`
When I wait until element located by `cssSelector(img.responsive-image__img.imager-ready)` appears

Scenario: Check the policies list
When I open URL `https://www.epam.com` in new tab
Then element located by `cssSelector(button#onetrust-accept-btn-handler)` exists for `PT3S` duration
When I click on element located by `cssSelector(button#onetrust-accept-btn-handler)`
When I scroll element located by `cssSelector(footer)` into view
When I wait until element located by `cssSelector(a.fat-links[href*='/investors'])` appears
When I wait until element located by `cssSelector(a.fat-links[href*='/cookie-policy'])` appears
When I wait until element located by `cssSelector(a.fat-links[href*='/open-source'])` appears
When I wait until element located by `cssSelector(a.fat-links[href*='/applicant-privacy-notice'])` appears
When I wait until element located by `cssSelector(a.fat-links[href*='privacy-policy'])` appears
When I wait until element located by `cssSelector(a.fat-links[href*='web-accessibility'])` appears

Scenario: Check that allow to switch location list by region
When I open URL `https://www.epam.com` in new tab
When I scroll element located by `cssSelector(section.section-ui)` into view
When I wait until element located by `cssSelector(a.tabs-23__link.js-tabs-link[role='tab'][data-item='0'])` appears
When I wait until element located by `cssSelector(a.tabs-23__link.js-tabs-link[role='tab'][data-item='1'])` appears
When I wait until element located by `cssSelector(a.tabs-23__link.js-tabs-link[role='tab'][data-item='2'])` appears
When I click on element located by `cssSelector(a.tabs-23__link.js-tabs-link[role='tab'][data-item='1'])`
When I wait until element located by `cssSelector(a.tabs-23__link.js-tabs-link.active[role='tab'][data-item='1'])` appears
When I click on element located by `cssSelector(a.tabs-23__link.js-tabs-link[role='tab'][data-item='2'])`
When I wait until element located by `cssSelector(a.tabs-23__link.js-tabs-link.active[role='tab'][data-item='2'])` appears
When I click on element located by `cssSelector(a.tabs-23__link.js-tabs-link[role='tab'][data-item='0'])`
When I wait until element located by `cssSelector(a.tabs-23__link.js-tabs-link.active[role='tab'][data-item='0'])` appears

Scenario: Check the search function
When I open URL `https://www.epam.com` in new tab
When I click on element located by `cssSelector(button.header-search__button.header__icon)`
When I enter `AI` in field located by `cssSelector(input#new_form_search.header-search__input.frequent-searches__input)`
When I click on element located by `cssSelector(button.custom-search-button)`
When I wait until element located by `cssSelector(h2.search-results__counter)` appears

Scenario: Check that the Company logo on the header leads to the main page
When I open URL `https://www.epam.com/about` in new tab
When I click on element located by `cssSelector(a.header__logo-link)`
Then `${current-page-url}` is equal to `https://www.epam.com/`
