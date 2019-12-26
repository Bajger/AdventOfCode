Class {
	#name : #PasswordCombinationsTest,
	#superclass : #TestCase,
	#instVars : [
		'passInstance'
	],
	#category : #'AdventOfCode-Tests'
}

{ #category : #accessing }
PasswordCombinationsTest >> passInstance [
	^ passInstance
]

{ #category : #accessing }
PasswordCombinationsTest >> passInstance: anObject [
	passInstance := anObject
]

{ #category : #running }
PasswordCombinationsTest >> setUp [ 
	super setUp.
	self passInstance:  PasswordCombinations new.
	
]

{ #category : #running }
PasswordCombinationsTest >> testAdjacentDigitsAreSame [

self passInstance evaluatedNumber: 12.
self passInstance currentDigitIndex: 2.
self deny: self passInstance adjacentDigitsAreSame.

self passInstance evaluatedNumber: 22.
self assert: self passInstance adjacentDigitsAreSame.
]

{ #category : #running }
PasswordCombinationsTest >> testAdjacentDigitsDecreasing [


self passInstance evaluatedNumber: 12.
self passInstance currentDigitIndex: 2.
self deny: self passInstance adjacentDigitsDecreasing.

self passInstance evaluatedNumber: 22.
self deny: self passInstance adjacentDigitsDecreasing.

self passInstance evaluatedNumber: 32.
self assert: self passInstance adjacentDigitsDecreasing.

]

{ #category : #running }
PasswordCombinationsTest >> testNumberMeetsPasswordCriteria [

self passInstance evaluatedNumber: 111111.
self assert: self passInstance numberMeetsPasswordCriteria.

self passInstance evaluatedNumber: 223450.
self deny: self passInstance numberMeetsPasswordCriteria.

self passInstance evaluatedNumber: 123789.
self deny: self passInstance numberMeetsPasswordCriteria.
]
