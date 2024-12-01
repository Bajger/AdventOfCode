Class {
	#name : 'ExclusivePasswordCombinationsTest',
	#superclass : 'PasswordCombinationsTest',
	#category : 'AdventOfCode-Tests-AoC2019',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2019'
}

{ #category : 'running' }
ExclusivePasswordCombinationsTest >> testNumberMeetsPasswordCriteria [

self passInstance evaluatedNumber: 112233.
self assert: self passInstance numberMeetsPasswordCriteria equals: true.

self passInstance evaluatedNumber: 123444.
self assert: self passInstance numberMeetsPasswordCriteria equals: false.

self passInstance evaluatedNumber: 111122.
self assert: self passInstance numberMeetsPasswordCriteria equals: true.

self passInstance evaluatedNumber: 331122.
self assert: self passInstance numberMeetsPasswordCriteria equals: false.

self passInstance evaluatedNumber: 334567.
self assert: self passInstance numberMeetsPasswordCriteria equals: true.

self passInstance evaluatedNumber: 134467.
self assert: self passInstance numberMeetsPasswordCriteria equals: true.

self passInstance evaluatedNumber: 134447.
self assert: self passInstance numberMeetsPasswordCriteria equals: false.

self passInstance evaluatedNumber: 134577.
self assert: self passInstance numberMeetsPasswordCriteria equals: true.
]

{ #category : 'private' }
ExclusivePasswordCombinationsTest >> testingClass [ 

	^ ExclusivePasswordCombinations
]
