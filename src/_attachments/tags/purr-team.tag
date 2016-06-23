<purr-team>

    <style>
        #team #container{
            position: relative;
            left: 0vw;
            width: 100vw; height: 100vw;
            min-width: 900px;
            transition: transform 1s ease;

            background-image: url('data:image/svg+xml,%3Csvg%20width%3D%221000%22%20height%3D%221000%22%20viewBox%3D%220%200%201000%201000%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20xmlns%3Axlink%3D%22http%3A//www.w3.org/1999/xlink%22%3E%3Ctitle%3Ebackground-halfhalf%3C/title%3E%3Cdesc%3ECreated%20with%20Sketch.%3C/desc%3E%3Cdefs%3E%3Cpath%20id%3D%22a%22%20d%3D%22M5%2028.2l5%2010h-10z%22/%3E%3Cmask%20id%3D%22b%22%20x%3D%22-4%22%20y%3D%22-4%22%20width%3D%2218%22%20height%3D%2218%22%3E%3Cpath%20fill%3D%22%23fff%22%20d%3D%22M-4%2024.2h18v18h-18z%22/%3E%3Cuse%20xlink%3Ahref%3D%22%23a%22/%3E%3C/mask%3E%3C/defs%3E%3Cg%20fill%3D%22none%22%3E%3Cpath%20fill%3D%22%23FDF3E2%22%20d%3D%22M1000%200v1000h-1000z%22/%3E%3Cpath%20fill%3D%22%236653FF%22%20d%3D%22M0%201000v-1000h1000z%22/%3E%3Cg%3E%3Cpath%20d%3D%22M502.2%20530c16.569%200%2030-13.431%2030-30%200-16.569-13.431-30-30-30-16.569%200-30%2013.431-30%2030%22%20id%3D%22Oval-1%22%20stroke%3D%22%236653FF%22%20stroke-width%3D%228%22%20stroke-linecap%3D%22round%22/%3E%3Cpath%20d%3D%22M502.2%20530c16.569%200%2030-13.431%2030-30%200-16.569-13.431-30-30-30-16.569%200-30%2013.431-30%2030%22%20stroke%3D%22%23FDF3E2%22%20stroke-width%3D%224%22%20stroke-linecap%3D%22round%22/%3E%3Cg%20id%3D%22Triangle-1%22%20transform%3D%22matrix%281%200%200%20-1%20467%20536.4%29%22%3E%3Cuse%20fill%3D%22%23FDF3E2%22%20xlink%3Ahref%3D%22%23a%22/%3E%3Cuse%20stroke%3D%22%236653FF%22%20mask%3D%22url%28%23b%29%22%20stroke-width%3D%228%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20xlink%3Ahref%3D%22%23a%22/%3E%3C/g%3E%3Cpath%20stroke%3D%22%23FDF3E2%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20fill%3D%22%23FDF3E2%22%20d%3D%22M472%20508.2l5-10h-10z%22/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;

            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: row;
        }
        .rotated #team #container{
            transform: rotate(-180deg);
        }
        .rotated360 #team #container{
            transform: rotate(-360deg);
        }
        #team #container div{
            width: 450px;
            max-width: 450px;
            height: 300px;
            max-height: 300px;
            
            display: flex;
            justify-content: flex-end;
            flex-direction: column;

            /*height: 300px;
            
            */
            background-repeat: no-repeat;
            background-position: left bottom;
            background-size: contain;

            cursor: pointer;
        }
        #team #container div:first-child{
            position: relative; 
            background-image: url('assets/images/toby.png'); 
            transform: rotate(-45deg);
            bottom: -13px;
            left: -0px; 

            border: 1px solid red;
        }
        #team #container div:last-child{
            position: relative; 
            background-image: url('assets/images/alex.png');
            transform: rotate(135deg);
            bottom: 13px;
            left: 0px;

            border: 1px solid red;
        }

        #team #container div h1,
        #team #container div p,
        #team #container div h1,
        #team #container div p{
            position: relative; left: 40%; bottom: 40px;
        }
        #team #container div p{
            height: 7em;
            margin-left: 50px;
            width: 100%;
            overflow: hidden;
        }


        @media only screen and (orientation: portrait){
            #team #container{            
                width: 100vh; height: 100vh;
            }
            #team #container div{
                width: 100vw;
                max-width: 100vw;
                height: 220px;
                max-height: 220px;
            }
            #team #container div:first-child{
                bottom: 160px;
                left: 50vw;
            }
            #team #container div:last-child{
                bottom: -160px;
                left: -50vw;
            }
            #team #container div h1,
            #team #container div p,
            #team #container div h1,
            #team #container div p{
                position: relative; left: 30%; bottom: 20px;
            }
            #team #container div p{
                margin-left: 40px;
                width: 50%;
            }
        }
    </style>

    <section id="team">

        <div id="container">
            <div onclick="{ this.rotate }">
                <h1>
                    Tobias Knothe <br/>
                    <small>{ PURR.i18n.team.toby.title }</small>
                </h1>
                <p>
			        { PURR.i18n.team.toby.bio }
                </p>
            </div>
            <div onclick="{ this.rotate }">
                <h1>
                    Alexander Schedler<br/>
                    <small>{ PURR.i18n.team.alex.title }</small>
                </h1>
                <p>
			        { PURR.i18n.team.alex.bio }
                </p>
            </div>
        </div>

    </section>

    <script>
        this.rotate = function(){
            document.body.classList.toggle('rotated');
            return;

            if( document.body.classList.contains('rotated') ){
                document.body.classList.remove('rotated');
                document.body.classList.add('rotated360');
                setTimeout(function(){
                    document.body.classList.remove('rotated360');
                },1100);
            }else{
                document.body.classList.add('rotated');
            }
        }
    </script>

</purr-team>