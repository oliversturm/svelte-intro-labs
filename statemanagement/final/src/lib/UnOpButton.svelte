<script>
  import { getContext } from 'svelte';

  import { contextKey } from './calculatorStore.js';
  const { value0 } = getContext(contextKey);

  const unaryOp = (f) => () => {
    const v0 = parseFloat($value0, 10);
    const result = f(v0);
    $value0 = result.toString(10);
  };
  const ops = {
    square: {
      caption: 'x²',
      handler: unaryOp((v) => v * v),
    },
    squareRoot: {
      caption: '√',
      handler: unaryOp((v) => Math.sqrt(v)),
    },
    negate: {
      caption: '+/-',
      handler: unaryOp((v) => -v),
    },
  };

  export let op;

  $: opInfo = ops[op] || {};
  $: caption = opInfo.caption || 'INVALID';
  $: handler = opInfo.handler || (() => {});
</script>

<div class="button" on:click={handler}>{caption}</div>
