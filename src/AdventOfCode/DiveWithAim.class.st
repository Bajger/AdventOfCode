"
AoC 2021 - day 2 part 2
"
Class {
	#name : 'DiveWithAim',
	#superclass : 'Dive',
	#instVars : [
		'aim'
	],
	#category : 'AdventOfCode-AoC2021',
	#package : 'AdventOfCode',
	#tag : 'AoC2021'
}

{ #category : 'accessing' }
DiveWithAim >> aim [

	^ aim
]

{ #category : 'accessing' }
DiveWithAim >> aim: anObject [

	aim := anObject
]

{ #category : 'private ' }
DiveWithAim >> goDown: unitValue [

	self aim: self aim + unitValue
]

{ #category : 'private ' }
DiveWithAim >> goForward: unitValue [

	super goForward: unitValue.
	self depth: self depth + (self aim * unitValue).
]

{ #category : 'private ' }
DiveWithAim >> goUp: unitValue [

	self aim: self aim - unitValue
]

{ #category : 'initialization' }
DiveWithAim >> initialize [ 
	super initialize.
	self aim: 0.
]
