## Introduction

This project implements a simple REST-based backend for managing todo lists. 
It is intended for demonstration and tests only.

## Installation

Make sure you have ruby 1.9.3 (RVM) environment and Bundler installed. Install the 
required gems using

    bundle install

and run the server

    bundle exec rails server

## API

The server implements the following JSON REST API:

    GET /todos
    GET /todos?since=<timestamp in format e.g. 2013-04-12T09:15:00Z>
    GET /todos/:id
    POST /todos
    PATCH/PUT /todos/:id
    DELETE /todos/:id

## Client

A simple JavaScript client for listing and adding todo items is in public/index.html

## Legal

Released under MIT license. Copyright 2013 Testcloud Oy.

## Credits

Based on Ryan Bates' railscast on Rails API (http://railscasts.com/episodes/348-the-rails-api-gem)
