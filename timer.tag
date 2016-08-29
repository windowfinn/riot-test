<timer>

    <p>Seconds Elapsed: { time }</p>

    <script>
        this.time = opts.start || 0

        tick() {
            car.trigger('run')
            this.update({ time: ++this.time })

        }

        var timer = setInterval(this.tick, 10000)

        this.on('unmount', function() {
            clearInterval(timer)
        })
    </script>

</timer>