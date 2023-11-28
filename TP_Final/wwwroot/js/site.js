function ValidatePassword()
{  
    let leng = false;
    let spec = false;
    let long = false;
    let upp = false;
    let password = document.getElementById("c1")
    var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;

    //Checking length
    if(password.value.length >= 8){leng = true;}

    //Checking length
    if(password.value.length <=50){long = true;}

    //Checking for special characters
    for (let i = 0; i < password.value.length; i++)
    {
        const element = password.value[i];
        if(format.test(element)){spec = true;}
    }

    //Checking for an uppercase
    for (let i = 0; i < password.value.length; i++) {
        const element = password.value[i];
        let txt = element;
        if (element === txt.toUpperCase()) {upp = true;}
    }

    //Validate all 3
    if(!leng)
    {
        PasswordAlert.textContent = "La contraseña debe tener al menos 8 caracteres.";
    }
    if(!long)
    {
        PasswordAlert.textContent = "La contraseña debe tener menos de 50 caracteres.";
    }
    if(!spec)
    {
        PasswordAlert.textContent = "La contraseña debe tener al menos 1 caracter especial.";
    }
    if(!upp)
    {
        PasswordAlert.textContent = "La contraseña debe tener al menos 1 letra mayuscula.";
    }
    if(spec && leng && upp && long){PasswordAlert.textContent = "";}
}

function ValidateRepeat()
{
    let c1 = document.getElementById("c1")
    let c2 = document.getElementById("c2")

    if(c1.value === c2.value){RepeatAlert.textContent = ""}
    else 
    {
        RepeatAlert.textContent = "La contraseñas no coinciden.";
    }
}

function ValidateEmail()
{
    var mailformat = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
    let mail = document.getElementById("mail")
    if(mail.value.test(mailformat)){MailAlert.textContent = "";}
    else
    {MailAlert.textContent = "El mail introducido no cumple con el formato de mail.";}
}

function ValidateName()
{  
    let leng = false;
    let long = false;
    let name = document.getElementById("name")

    //Checking length
    if(name.value.length >= 3){leng = true;}

    //Checking length
    if(name.value.length <=50){long = true;}

    //Validate all 3
    if(!leng)
    {
        NameAlert.textContent = "El nombre debe tener al menos 3 caracteres.";
    }
    if(!long)
    {
        NameAlert.textContent = "El nombre debe tener menos de 50 caracteres.";
    }
    if(leng && long){NameAlert.textContent = "";}
}

function ValidateApellido()
{  
    let leng = false;
    let long = false;
    let user = document.getElementById("a")

    //Checking length
    if(user.value.length >= 3){leng = true;}

    //Checking length
    if(user.value.length <=50){long = true;}

    //Validate all 3
    if(!leng)
    {
        ApellidoAlert.textContent = "El apellido debe tener al menos 3 caracteres.";
    }
    if(!long)
    {
        ApellidoAlert.textContent = "El apellido debe tener menos de 50 caracteres.";
    }
    if(leng && long){ApellidoAlert.textContent = "";}
}

function ValidateUser()
{  
    let leng = false;
    let long = false;
    let user = document.getElementById("user")

    //Checking length
    if(user.value.length >= 8){leng = true;}

    //Checking length
    if(user.value.length <= 50){long = true;}

    //Validate all 3
    if(!leng)
    {
        UserAlert.textContent = "El nombre debe tener al menos 8 caracteres.";
    }
    if(!long)
    {
        UserAlert.textContent = "El nombre debe tener menos de 50 caracteres.";
    }
    if(leng && long){UserAlert.textContent = "";}

    var username = $('#user').val();

    $.ajax({
        type: 'POST',
        url: 'Home/UsuarioExists', // Reemplaza esto con la URL de tu acción de validación en el servidor
        data: { IdUsuario: username},
        typeData: 'JSON',
        success: function(response) {
            console.log(response);
            if (response == NULL) {
                $('#UserAlert').text('Nombre de usuario disponible').removeClass('alert-error').addClass('alert-success');
            } else {
                $('#UserAlert').text('Nombre de usuario no disponible').removeClass('alert-success').addClass('alert-error');
            }
        },
        error: function(response){
            $('#UserAlert').text('no anda').removeClass('alert-error').addClass('alert-success');
        }
    });
}

function ValidateTitle()
{  
    let leng = false;
    let long = false;
    let user = document.getElementById("titulo")

    //Checking length
    if(user.value.length >= 15){leng = true;}

    //Checking length
    if(user.value.length <= 50){long = true;}

    if(!leng)
    {
        TitleAlert.textContent = "El titulo debe tener al menos 15 caracteres.";
    }
    if(!long)
    {
        TitleAlert.textContent = "El titulo debe tener menos de 50 caracteres.";
    }
    if(leng && long){TitleAlert.textContent = "";}
}

function ValidateTitlePosteos()
{  
    let leng = false;
    let long = false;
    let user = document.getElementById("titulo")

    //Checking length
    if(user.value.length >= 15){leng = true;}

    //Checking length
    if(user.value.length <= 200){long = true;}

    if(!leng)
    {
        TitleAlert.textContent = "El titulo debe tener al menos 15 caracteres.";
    }
    if(!long)
    {
        TitleAlert.textContent = "El titulo debe tener menos de 200 caracteres.";
    }
    if(leng && long){TitleAlert.textContent = "";}
}

function ValidateSubtitle()
{  
    let leng = false;
    let long = false;
    let user = document.getElementById("subtitle")

    //Checking length
    if(user.value.length >= 15){leng = true;}

    //Checking length
    if(user.value.length <= 400){long = true;}

    if(!leng)
    {
        SubAlert.textContent = "El subtitulo debe tener al menos 15 caracteres.";
    }
    if(!long)
    {
        SubAlert.textContent = "El subtitulo debe tener menos de 400 caracteres.";
    }
    if(leng && long){TitleAlert.textContent = "";}
}

function ValidateDesc()
{  
    let leng = false;
    let long = false;
    let user = document.getElementById("Desc")

    //Checking length
    if(user.value.length >= 15){leng = true;}

    //Checking length
    if(user.value.length <= 400){long = true;}

    if(!leng)
    {
        DescAlert.textContent = "La descripcion debe tener al menos 15 caracteres.";
    }
    if(!long)
    {
        DescAlert.textContent = "La descripcion debe tener menos de 400 caracteres.";
    }
    if(leng && long){DescAlert.textContent = "";}
}

function ValidateCorpse()
{  
    let leng = false;
    let long = false;
    let user = document.getElementById("corpse")

    //Checking length
    if(user.value.length >= 1){leng = true;}

    //Checking length
    if(user.value.length <= 5000){long = true;}

    if(!leng)
    {
        CorpAlert.textContent = "El cuerpo debe tener algo de informacion.";
    }
    if(!long)
    {
        CorpAlert.textContent = "El cuerpo debe tener menos de 5000 caracteres.";
    }
    if(leng && long){TitleAlert.textContent = "";}
}