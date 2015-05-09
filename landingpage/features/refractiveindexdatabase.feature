Feature: Refractive Index database
  # Enter feature description here

  Scenario: Customer Come to refractive index Database page from the landing page
    Given Customer come to Landing Page without login
    When Click the tab_002 in the header
    Then see the title is DatabaseDirectory

  Scenario: Customer on refractive index database page can go back to home page
    Given Customer come to the refractive index landing page
    When Click the tab_001 in the header
    Then see the title is FDTD

  Scenario: Customer on index landing page go to index app page
    Given Customer come to the refractive index landing page
    When Click goto FDTD INDEX
    Then see the title is INDEXApp

  Scenario: Customer on index app page can search element and get RFIndex Chart
    Given Customer on index app page
    When search an element
    And see the element list
    And click the first elementlist
    Then see the google chart svg

  Scenario: Customer on index landing page go to RESTAPIguide page
    Given Customer come to the refractive index landing page
    When Click goto RESTAPI guide page
    Then see the title is RESTGuide

  Scenario: Customer Come to refractive index Database landing page from the landing page
    Given Customer come to Landing Page without login
    When Click the gotoindexlandingpage button
    Then see the title is DatabaseDirectory