<up>
    <div class="light green" if={ engineOn }></div>
    <div class="light red" if={ engineOn }></div>

    <div>
        <button onclick={ start }>Start engine</button>
    </div>


    <script>
        var self = this
        car.on('start', function () {
            self.engineOn = true
            self.update()
        })

        start() {
            car.trigger('start')
        }
    </script>

    <style>
        .light {
            display: inline-block;
            margin: 20px;
            height: 50px;
            width: 50px;
            background: #FFD75A;
            border: 2px solid #444;
            border-radius: 50%;
        }

        .red {
            display: inline-block;
            margin: 20px;
            height: 50px;
            width: 50px;
            background: red;
            border: 2px solid #444;
            border-radius: 50%;
        }

        .green {
            display: inline-block;
            margin: 20px;
            height: 50px;
            width: 50px;
            background: green;
            border: 2px solid #444;
            border-radius: 50%;
        }
    </style>
</up>