httpproxy
=============

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with miami](#setup)
    * [What httpproxy affects](#what-httpproxy-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with miami](#beginning-with-httpproxy)
4. [Usage - Configuration options and additional functionality](#usage)
    * [Customize the httpproxy options](#customize-the-httpproxy-options)
    * [Configure with hiera yaml](#configure-with-hiera-yaml)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
8. [Contributors](#contributors)

## Overview

Provides a simple way to manage proxies in the profile.d

## Module Description

Using the profiled module written by unibet, a bash script is placed in the
profile.d directory specifying a desired proxy.

## Setup

### What httpproxy affects

Many programs will check against profile.d for certain defaults. The obvious
being your default shell.

### Setup Requirements

only need to install the module

### Beginning with httpproxy

## Usage

### Customize the httpproxy options

### Configure with hiera yaml

## Reference

### Classes

## Limitations

This module has tested against Puppet 3.8.1, CentOS 7, and Ubuntu 14.04.  
Unibets module has been tested on RedHat 6/7, CentOS 6/7, OracleLinux 6/7.

No plans to support other versions, unless you'd like to help :P

## Development

Pull Requests welcome

## Contributors

Chris Edester and Michael Callahan
