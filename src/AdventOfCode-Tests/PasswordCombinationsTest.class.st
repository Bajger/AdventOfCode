Class {
	#name : #PasswordCombinationsTest,
	#superclass : #TestCase,
	#instVars : [
		'passInstance'
	],
	#category : #'AdventOfCode-Tests-AoC2019'
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
	self passInstance:  self testingClass new.
	
]

{ #category : #running }
PasswordCombinationsTest >> testAdjacentDigitsAreSame [

	self passInstance resetAdjacentCriteria.
	self passInstance evaluatedNumber: 12.
	self passInstance currentDigitIndex: 2.
	self passInstance evaluateAdjacentCriteria.
	self passInstance currentDigitIndex: 1.
	self passInstance evaluateAdjacentCriteria.

	self deny: self passInstance adjacentDigitsAreSame.


	self passInstance resetAdjacentCriteria.
	self passInstance evaluatedNumber: 22.
	self passInstance currentDigitIndex: 2.
	self passInstance evaluateAdjacentCriteria.
	self passInstance currentDigitIndex: 1.
	self passInstance evaluateAdjacentCriteria.
	self assert: self passInstance adjacentDigitsAreSame.
]

{ #category : #running }
PasswordCombinationsTest >> testAdjacentDigitsDecreasing [

self passInstance resetAdjacentCriteria.
self passInstance evaluatedNumber: 12.
self passInstance numberMeetsPasswordCriteria.
self deny: self passInstance adjacentDigitsDecreasing.

self passInstance resetAdjacentCriteria.
self passInstance evaluatedNumber: 22.
self passInstance numberMeetsPasswordCriteria.
self deny: self passInstance adjacentDigitsDecreasing.

self passInstance resetAdjacentCriteria.
self passInstance evaluatedNumber: 32.
self passInstance numberMeetsPasswordCriteria.
self assert: self passInstance adjacentDigitsDecreasing.

]

{ #category : #running }
PasswordCombinationsTest >> testCompute [

	self passInstance input: '123455-123456'.
	self assert: self passInstance compute equals: 1.

	self passInstance input: '113455-113465'.
	self assert: self passInstance compute equals: 5.
	
	self passInstance input: '113455-113466'.
	self assert: self passInstance compute equals: 6.

	self passInstance input: '113455-113455'.
	self assert: self passInstance compute equals: 1.

	self passInstance input: '113455-111111'.
	self assert: self passInstance compute equals: 0.
]

{ #category : #running }
PasswordCombinationsTest >> testCurrentDigit [

self passInstance evaluatedNumber: 123456.
self passInstance currentDigitIndex: 6.
self assert: self passInstance currentDigit equals: 1.

self passInstance currentDigitIndex: 2.
self assert: self passInstance currentDigit equals: 5.
]

{ #category : #running }
PasswordCombinationsTest >> testGetPasswordInterval [

self passInstance input: '111111-666666'.
self assert: self passInstance getPasswordInterval equals: (Interval from: 111111 to: 666666).


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

{ #category : #private }
PasswordCombinationsTest >> testingClass [ 
	
	^ PasswordCombinations
]
