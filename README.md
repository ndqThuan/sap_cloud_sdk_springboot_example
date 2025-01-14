# RFQ Application

A simple application to display RFQ list and details.

## Table of Contents

- [RFQ Application](#rfq-application)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Key Features](#key-features)
  - [Getting Started](#getting-started)
  - [Configuring S4HANA Cloud Destination](#configuring-s4hana-cloud-destination)
  - [Project Structure](#project-structure)
  - [Dependencies](#dependencies)

## Overview

This application displays a list of RFQs (Request for Quotations) along with their detailed information. It is built to connect to an S4HANA cloud destination.

## Key Features

- Displays list of RFQs with detailed information
- Connects to S4HANA cloud destination

## Getting Started

To get started with this project, you need to configure the connection to your S4HANA cloud destination.

## Configuring S4HANA Cloud Destination

1. Create a properties file with your S4HANA cloud destination credentials.
2. Update the configuration class to reference the properties file name.

## Project Structure

- The application has a standard structure, with JTE templates in the `src/main/jte` directory.

## Dependencies

- Spring Boot
- JTE Template Engine
- SAP Cloud SDK
