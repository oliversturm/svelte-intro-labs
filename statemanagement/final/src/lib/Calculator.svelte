<script>
  import { setContext } from 'svelte';

  import CalculatorDisplay from './CalculatorDisplay.svelte';
  import CharButton from './CharButton.svelte';
  import EnterButton from './EnterButton.svelte';
  import { getCalculatorValues, contextKey } from './calculatorStore';
  import BinOpButton from './BinOpButton.svelte';
  import UnOpButton from './UnOpButton.svelte';
  import MemoryButton from './MemoryButton.svelte';

  const calculatorValues = getCalculatorValues();
  setContext(contextKey, calculatorValues);
</script>

<div class="calculator">
  <CalculatorDisplay />
  <div class="keys">
    <CharButton char="7" />
    <CharButton char="8" />
    <CharButton char="9" />
    <BinOpButton op="divide" />
    <MemoryButton op="mplus" />

    <CharButton char="4" />
    <CharButton char="5" />
    <CharButton char="6" />
    <BinOpButton op="multiply" />
    <MemoryButton op="mminus" />

    <CharButton char="1" />
    <CharButton char="2" />
    <CharButton char="3" />
    <BinOpButton op="minus" />
    <MemoryButton op="mr" />

    <div />
    <CharButton char="0" />
    <CharButton char="." once={true} />
    <BinOpButton op="plus" />
    <div />

    <UnOpButton op="square" />
    <UnOpButton op="squareRoot" />
    <UnOpButton op="negate" />
    <EnterButton />
    <div />
  </div>
</div>

<style>
  .calculator {
    width: 400px;
  }
  .keys {
    padding: 2rem 0;
    display: grid;
    grid-template-columns: auto auto auto auto auto;
  }
  /* Note - :global means that the class .button does not receive
     an automatic postfix. Since it is used as a class expected to be
     nested underneath the (non-global) .keys, you may not consider
     it to be global in that sense.
     The point of this case is that Svelte does not throw away the 
     class (because it's locally unused), and so it can be used
     by child components of this component.
   */
  .keys :global(.button) {
    border: 2px solid gray;
    margin: 3px;
    text-align: center;
    font-weight: bold;
    padding: 2px;
    cursor: pointer;
  }
</style>
