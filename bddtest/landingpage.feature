# Created by yutongpang at 4/16/15
Feature: Landing Page
  # Enter feature description here

  Scenario: Customer Not login
    Given Customer come to Landing Page without login
    Then see the title is FDTD
