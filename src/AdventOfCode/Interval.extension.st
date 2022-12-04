Extension { #name : #Interval }

{ #category : #'*AdventOfCode' }
Interval >> mutuallyContains: anInterval [

	^ (self includesAll: anInterval) or: [ anInterval includesAll: self ]
]
