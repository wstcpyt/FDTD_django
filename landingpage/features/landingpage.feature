# Created by yutongpang at 4/16/15
Feature: Landing Page
  # Enter feature description here
  Scenario: Customer from landing Page to FDTD App Page without login
    Given Customer come to Landing Page without login
    When Click get started button
    Then see the title is SignIn

  Scenario: Customer from landing Page to FDTD App Page with login
    Given Customer come to Landing Page without login
    Then See the login button
    When  Customer login
    Then User already login
    When Click get started button
    Then see the title FDTD App
    Then Customer logout

  Scenario: Customer Not login
    Given Customer come to Landing Page without login
    Then See the login button
    Then see the title is FDTD

   Scenario: Customer Not login Can see the Login Button
     Given  Customer come to Landing Page without login
     Then See the login button
     When Click the SignIn Button
     Then see the title is SignIn

   Scenario: Customer Login Can see the username
     Given Customer come to Landing Page without login
     Then See the login button
     When  Customer login
     Then User already login
     Then  Customer logout
     Then See the login button
