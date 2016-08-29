<jenkins-build>

    <div id="gauge{title}" class="200x160px"></div>

    <script>

        this.title = opts.title
        var buildUrl = opts.buildurl

        var lastBuildUrl = buildUrl + "/lastBuild/api/json"
        var lastCompletedBuildUrl = buildUrl + "/lastCompletedBuild/api/json"

        this.result = 0

        var self = this

        this.on('mount', function() {

             self.g = new JustGage({
                id: "gauge" + this.title,
                value: this.result,
                min: 0,
                max: 100,
                title: this.title
            });

            $('.grid').masonry({
                // options
                itemSelector: '.grid-item',
                columnWidth: 200
            });

        })

        this.on('updated', function() {
            self.g.refresh(self.result);
        })

        tick() {

            $.getJSON( lastBuildUrl, function( data ) {

                var currentStatus = data.result;

                console.log(currentStatus)

                if (data.building) {

                    $.getJSON( lastCompletedBuildUrl, function( moredata ) {

                        var lastDurationMS = moredata.duration;

                        var lastDurationSeconds = Math.round(lastDurationMS / 1000);

                        var timestamp = data.timestamp;

                        var currentDuration = Math.round((new Date().getTime() / 1000) - (timestamp / 1000));

                        if (currentDuration >= lastDurationSeconds) {
                            self.result = 99;
                        }

                        self.result = Math.round((currentDuration * 100) / lastDurationSeconds);

                        self.update(this.result)

                    });


                }

            });
        }

        //var timer = setInterval(this.tick, 10000)

        //this.on('unmount', function() {
        //    clearInterval(timer)
        //})

        //this.tick

        car.on('run', function () {
            //console.log('run' + self.title)
            self.tick()
        })
    </script>
</jenkins-build>