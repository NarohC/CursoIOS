#!/usr/bin/env swift
let numbers = (1 ... Int(CommandLine.arguments[1])!)
let result = numbers.reduce(0, +)
print(result)

