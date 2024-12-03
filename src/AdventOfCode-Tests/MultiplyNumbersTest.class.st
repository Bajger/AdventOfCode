"
A MultiplyNumbersTest is a test class for testing the behavior of MultiplyNumbers
"
Class {
	#name : 'MultiplyNumbersTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2024',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2024'
}

{ #category : 'tests' }
MultiplyNumbersTest >> testCompute [ 
	|solution|
	solution := MultiplyNumbers new.
	self assert: solution compute equals: 164730528.
]

{ #category : 'tests' }
MultiplyNumbersTest >> testComputeSample [ 
	|solution|
	solution := MultiplyNumbers new.
	solution input: 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'.
	self assert: solution compute equals: 161.
]
