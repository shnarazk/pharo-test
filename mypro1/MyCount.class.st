"
counter object
"
Class {
	#name : #MyCount,
	#superclass : #Object,
	#instVars : [
		'val'
	],
	#category : #mypro1
}

{ #category : #updating }
MyCount >> decrement [ 
  val := val - 1
]

{ #category : #updating }
MyCount >> increment [ 
 val := val + 1
]

{ #category : #initalize }
MyCount >> new [
	val := 0.
	^ self
]

{ #category : #evaluating }
MyCount >> value [
   ^val
]

{ #category : #updating }
MyCount >> value: v [
   val := v
]
