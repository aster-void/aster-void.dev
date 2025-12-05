<script lang="ts">
	import Typewriter from './Typewriter.svelte';

	let { onSequenceComplete }: { onSequenceComplete?: () => void } = $props();

	let commandFinished = $state(false);
	let enterPressed = $state(false);
	let resultVisible = $state(false);

	function onCommandComplete() {
		commandFinished = true;
		setTimeout(() => {
			enterPressed = true;
			setTimeout(() => {
				resultVisible = true;
				setTimeout(() => {
					onSequenceComplete?.();
				}, 300);
			}, 200);
		}, 700);
	}
</script>

<section class="space-y-4">
	<p
		class="font-mono text-lg text-[var(--text-secondary)] md:text-xl"
		style="transform: translateY({enterPressed ? '0' : '80px'})"
	>
		<span class="text-[var(--accent-cyan)]">$</span>
		<Typewriter
			text=" whoami"
			delay={300}
			speed={80}
			onComplete={onCommandComplete}
			cursor={!commandFinished}
		/>
	</p>
	<h1
		class="text-6xl font-bold tracking-tight md:text-8xl"
		class:invisible={!resultVisible}
		style={resultVisible ? 'animation: slideInUp 0.8s ease-out' : ''}
	>
		<span
			class="bg-gradient-to-r from-[var(--accent-cyan)] via-[var(--accent-purple)] to-[var(--accent-pink)] bg-clip-text text-transparent"
		>
			aster-void
		</span>
	</h1>
</section>
