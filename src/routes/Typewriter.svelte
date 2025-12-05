<script lang="ts">
	import { onMount } from 'svelte';

	let {
		text,
		delay = 0,
		speed = 50,
		cursor = true,
		onComplete
	}: {
		text: string;
		delay?: number;
		speed?: number;
		cursor?: boolean;
		onComplete?: () => void;
	} = $props();

	let displayedText = $state('');
	let isTyping = $state(false);

	onMount(() => {
		const timeout = setTimeout(() => {
			isTyping = true;
			let i = 0;
			const interval = setInterval(() => {
				if (i < text.length) {
					displayedText = text.slice(0, i + 1);
					i++;
				} else {
					clearInterval(interval);
					isTyping = false;
					onComplete?.();
				}
			}, speed);

			return () => clearInterval(interval);
		}, delay);

		return () => clearTimeout(timeout);
	});
</script>

<span class="typewriter-container">
	<span>{displayedText}</span>
	{#if cursor && isTyping}
		<span class="cursor">▋</span>
	{/if}
</span>

<style>
	.typewriter-container {
		display: inline;
	}

	.cursor {
		color: var(--accent-cyan);
		margin-left: 1px;
		animation: cursorBlink 0.7s step-end infinite;
	}

	@keyframes cursorBlink {
		0%,
		100% {
			opacity: 1;
		}
		50% {
			opacity: 0;
		}
	}
</style>
