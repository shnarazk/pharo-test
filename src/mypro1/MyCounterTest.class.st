Class {
	#name : #MyCounterTest,
	#superclass : #TestCase,
	#category : #mypro1
}

{ #category : #tests }
MyCounterTest >> testCreatingMyCounter [
	| c |
	c := MyCounter new.
	c value: 4.
	self assert: c value equals: 4
]

{ #category : #tests }
MyCounterTest >> testDecreatingMyCounter [
	| c |
	c := MyCounter new.
	c value: 4.
	c decrement.
	self assert: c value equals: 3
]

{ #category : #tests }
MyCounterTest >> testIncrementingMyCounter [
	| c |
	c := MyCounter new.
	c value: 4.
	c increment.
	self assert: c value equals: 5
]
