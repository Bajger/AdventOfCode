"
A LifeSupportRatingTest is a test class for testing the behavior of LifeSupportRating
"
Class {
	#name : #LifeSupportRatingTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2021'
}

{ #category : #test }
LifeSupportRatingTest >> testCompute [

	|lifeSupport|
	lifeSupport := LifeSupportRating new.
	lifeSupport input: '00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010'.
	self assert: lifeSupport compute equals: 230.
]

{ #category : #test }
LifeSupportRatingTest >> testFindCO2RatingFrom [

	|lifeSupport|
	lifeSupport := LifeSupportRating new.
	lifeSupport input: '00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010'.
	self assert: (lifeSupport findCO2RatingFrom: lifeSupport diagnosticNumbers) equals: 10.
]

{ #category : #test }
LifeSupportRatingTest >> testFindOxygenRatingFrom [

		|lifeSupport|
	lifeSupport := LifeSupportRating new.
	lifeSupport input: '00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010'.
	self assert: (lifeSupport findOxygenRatingFrom: lifeSupport diagnosticNumbers) equals: 23.
]

{ #category : #test }
LifeSupportRatingTest >> testGetCO2BitFilter [

	|lifeSupport|
	lifeSupport := LifeSupportRating new.
	lifeSupport input: '00100
	00010
	00010
	00010'.
	self assert: (lifeSupport getCO2BitFilter value: lifeSupport diagnosticNumbers value: 2) equals: 0.
	self assert: (lifeSupport getCO2BitFilter value: lifeSupport diagnosticNumbers value: 1) equals: 1.
]

{ #category : #tests }
LifeSupportRatingTest >> testGetOxygenBitFilter [

	|lifeSupport|
	lifeSupport := LifeSupportRating new.
	lifeSupport input: '00100
	00010
	00010
	00010'.
	self assert: (lifeSupport getOxygenBitFilter value: lifeSupport diagnosticNumbers value: 2) equals: 1.
	self assert: (lifeSupport getOxygenBitFilter value: lifeSupport diagnosticNumbers value: 1) equals: 0.
]

{ #category : #tests }
LifeSupportRatingTest >> testLeastCommonBitAtFrom [

	|lifeSupport|
	lifeSupport := LifeSupportRating new.
	lifeSupport input: '00100
	00010
	00010
	00010'.
	self assert: (lifeSupport leastCommonBitAt: 1 from: lifeSupport diagnosticNumbers) equals: 1.
	self assert: (lifeSupport leastCommonBitAt: 2 from: lifeSupport diagnosticNumbers) equals: 0.
]

{ #category : #tests }
LifeSupportRatingTest >> testLeastCommonBitAtFromWhenEqual [

	|lifeSupport|
	lifeSupport := LifeSupportRating new.
	lifeSupport input: '0
	0
	1
	1'.
	self assert: (lifeSupport leastCommonBitAt: 1 from: lifeSupport diagnosticNumbers) equals: 0.
]
