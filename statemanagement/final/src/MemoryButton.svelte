<script>
  import { getContext } from 'svelte';

  import { contextKey } from './calculatorStore.js';
  const { value0, memval } = getContext(contextKey);

  const memOp = (f) => () => {
    const v0 = parseFloat($value0, 10);
    const mv = parseFloat($memval, 10);
    f(v0, mv);
  };
  const ops = {
    mplus: {
      caption: 'M+',
      handler: memOp((v0, mv) => {
        $memval = (mv + v0).toString(10);
      }),
    },
    mminus: {
      caption: 'M-',
      handler: memOp((v0, mv) => {
        $memval = (mv - v0).toString(10);
      }),
    },
    mr: {
      caption: 'MR',
      handler: memOp((v0, mv) => {
        $value0 = mv.toString(10);
      }),
    },
  };

  export let op;

  $: opInfo = ops[op] || {};
  $: caption = opInfo.caption || 'INVALID';
  $: handler = opInfo.handler || (() => {});
</script>

<div class="button" on:click={handler}>{caption}</div>
