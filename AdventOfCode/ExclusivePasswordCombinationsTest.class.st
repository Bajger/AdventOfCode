Class {
	#name : #ExclusivePasswordCombinationsTest,
	#superclass : #PasswordCombinationsTest,
	#category : #'AdventOfCode-Tests'
}

{ #category : #running }
ExclusivePasswordCombinationsTest >> testNumberMeetsPasswordCriteria [
"
self passInstance evaluatedNumber: 112233.
self assert: self passInstance numberMeetsPasswordCriteria equals: true.

self passInstance evaluatedNumber: 123444.
self assert: self passInstance numberMeetsPasswordCriteria equals: false."

self passInstance evaluatedNumber: 111122.
self assert: self passInstance numberMeetsPasswordCriteria equals: true.
]

{ #category : #private }
ExclusivePasswordCombinationsTest >> testingClass [ 

	^ ExclusivePasswordCombinations
]
