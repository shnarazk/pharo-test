"
counter object
"
Class {
	#name : #MyCounter,
	#superclass : #Object,
	#instVars : [
		'val'
	],
	#category : #mypro1
}

{ #category : #updating }
MyCounter >> decrement [
	val := val - 1
]

{ #category : #updating }
MyCounter >> increment [
	"need document"

	val := val + 1
]

{ #category : #initalize }
MyCounter >> new [
	val := 0.
	^ self
]

{ #category : #evaluating }
MyCounter >> value [
	^ val
]

{ #category : #updating }
MyCounter >> value: v [
	val := v
]
