" Vim syntax file
" Language: NMODL (mod)
" Last Change: Tue Oct 22 19:36:30 CEST 2013
" Author: Jose Guzman sjm.guzman@gmail.com

if exists("b:current_syntax")
    finish
endif

echom "Loading NMODL Vim syntax"
setlocal foldmethod=syntax

let b:current_syntax = "NMODL"


" Keywords
syntax keyword NMODLKeywords TITLE 
syntax keyword NMODLKeywords NEURON UNITS PARAMETER ASSIGNED 
syntax keyword NMODLKeywords ASSIGNED STATE KINETIC INITIAL  
syntax keyword NMODLKeywords BREAKPOINT DERIVATIVE
syntax keyword NMODLKeywords PROCEDURE FUNCTION
syntax keyword NMODLKeywords NET_RECEIVE

syntax keyword NMODLFunction LOCAL GLOBAL
syntax keyword NMODLFunction POINT_PROCESS  SUFFIX contained
syntax keyword NMODLFunction USEION READ WRITE contained
syntax keyword NMODLFunction RANGE NONSPECIFIC_CURRENT contained
syntax keyword NMODLFunction POINTER contained 
syntax keyword NMODLFunction SOLVE METHOD contained 
syntax keyword NMODLFunction CONSERVE contained 
syntax keyword NMODLFunction THREADSAFE contained 

syntax keyword NMODLMath acos asin atan atan2 ceil cos cosh exp fabs floor fmod log log10 pow sin sinh sqrt tan tanh area ca cai cao celsius dt eca ek ena ica ik ina k ki ko na nai nao t v 

syntax keyword NMODLConditional if else while for contained
syntax keyword NMODLNET_RECEIVE flag net_send net_move contained

syntax keyword NMODLFix  TODO FIXME XXX NOTE

" General matches
syntax match NMODLComment "\v:.*$" contains=NMODLFix

" Match DE solver methods
syntax match NMODLDESolver "cnexp" 
syntax match NMODLDESolver "derivimplicit" 
syntax match NMODLDESolver "sparse"

" Match Operators
syntax match NMODLOperator "\v\*"
syntax match NMODLOperator "\v/"
syntax match NMODLOperator "\v\+"
syntax match NMODLOperator "\v-"
syntax match NMODLOperator "\v\?"
syntax match NMODLOperator "\v\*\="
syntax match NMODLOperator "\v/\="
syntax match NMODLOperator "\v\+\="
syntax match NMODLOperator "\v-\="
syntax match NMODLOperator "\v\="
syntax match NMODLOperator "\v\!"

" for kinetic schemes
syntax match NMODLOperator "\v\~"
syntax match NMODLOperator "\v\>"
syntax match NMODLOperator "\v\<"
syntax match NMODLOperator "\v\\"
syntax match NMODLOperator "\v\|"

" integer numbers
syntax match NMODLNumbers "\<\d\+[ij]\=\>" contained

" floating point numbers, with dot, optional exponent
syntax match NMODLNumbers "\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"

" floating point number, starting with a dot, optional exponent
syntax match NMODLNumbers "\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Regions
syntax region NMODLINFO start="COMMENT" end="ENDCOMMENT" fold contains=NMODLKeywords,NMODLFix

" To fold blocks (use za)
syntax region NMODLBLOCK start="{" end="}" fold contains=ALL

" Define the default highlighting.
highlight link NMODLKeywords    Keyword
highlight link NMODLFunction    Function
highlight link NMODLConditional Conditional
highlight link NMODLDESolver    Typedef 
highlight link NMODLMath        Typedef 
highlight link NMODLComment     Comment
highlight link NMODLString      String
highlight link NMODLOperator    Operator
highlight link NMODLFix         Todo 
highlight link NMODLINFO        Macro 
highlight link NMODLNumbers     Number 
highlight link NMODLNET_RECEIVE Function 
