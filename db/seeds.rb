# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


questions_content = [
'En cuanto a la autonomía de las regiones frente al centro político',
'Nuestro sistema democrático de decisiones debería estar basado en',
'Tomando en cuenta la relación entre el Gobierno y el Congreso, Chile debería ser',
'La Nueva Constitución debe ser fruto de',
'Sobre el derecho a vivir en un medioambiente adecuado y libre de contaminación',
'La gratuidad de la educación superior',
'El reconocimiento de los Pueblos Originarios',
'La discriminación positiva hacia ciertos grupos hoy sub-representados en muchos ámbitos (mujeres, indígenas, jóvenes)'
]

questions = questions_content.each_with_index.map do |content, index|
  Question.create({
    content: content,
    number: index + 1
    })
end

answers = [
  {
    content: 'Es importante asegurar que el país siga teniendo una unidad en sus políticas, en sus leyes y en el criterio de los jueces, como es nuestra tradición histórica',
    question_number: 1,
    XAxis: 0,
    YAxis: 6
  },
  {
    content: 'Hay que combinar un Estado Centralizado con mayores grados de descentralización, por ejemplo, eligiendo por voto a la autoridad máxima de cada región',
    question_number: 1,
    XAxis: 0,
    YAxis: 3
  },
  {
    content: 'Chile debe ser un Estado Federal: cada región con autonomía para tener sus propias leyes, cortes, y gobiernos, como pasa en otros países',
    question_number: 1,
    XAxis: 0,
    YAxis: 0
  },
  {
    content: 'Democracia representativa: hay que darle importancia a las instituciones y a las autoridades, pues han sido democráticamente electas para representar a la ciudadanía',
    question_number: 2,
    XAxis: 0,
    YAxis: 6
  },
  {
    content: 'Democracia participativa: la democracia representativa necesita mayores espacios para escuchar a la ciudadanía de los actualmente tiene',
    question_number: 2,
    XAxis: 0,
    YAxis: 3
  },
  {
    content: 'Democracia directa: Debemos avanzar a que las personas puedan participar directa y vinculantemente a través de plebiscitos y consultas',
    question_number: 2,
    XAxis: 0,
    YAxis: 0
  },
  {
    content: 'Presidencialista: el Presidente debe llevar la política exterior e interna, y debe tener las herramientas necesarias para llevar a cabo su programa, por el cual la mayoría del país votó',
    question_number: 3,
    XAxis: 0,
    YAxis: 6
  },
  {
    content: 'Semipresidencialismo: debe haber un Presidente, elegido para llevar la política exterior y garantizar unidad, y un Primer Ministro, que esté a cargo del gobierno interior',
    question_number: 3,
    XAxis: 0,
    YAxis: 3
  },
  {
    content: 'Parlamentarismo: el jefe del gobierno debe ser un parlamentario, quien se mantendrá en su cargo mientras cuente con la confianza del Congreso.',
    question_number: 3,
    XAxis: 0,
    YAxis: 0
  },
  {
    content: 'Un acuerdo amplio dentro de las reglas que ya conocemos, es decir, en el Congreso',
    question_number: 4,
    XAxis: 0,
    YAxis: 6
  },
  {
    content: 'Un mecanismo híbrido que contemple al Congreso, pero también a otros ciudadanos expertos o que sean representativos de la ciudadanía',
    question_number: 4,
    XAxis: 0,
    YAxis: 3
  },
  {
    content: 'Una Asamblea Constituyente especialmente elegida para esa tarea, compuesta por miembros representativos de los distintos grupos de la sociedad',
    question_number: 4,
    XAxis: 0,
    YAxis: 0
  },
  {
    content: 'Una Asamblea Constituyente especialmente elegida para esa tarea, compuesta por miembros representativos de los distintos grupos de la sociedad',
    question_number: 5,
    XAxis: 6,
    YAxis: 0
  },
  {
    content: 'Debiese garantizarse el derecho como un principio general, debiendo los parlamentarios y el gobierno darle una bajada concreta',
    question_number: 5,
    XAxis: 3,
    YAxis: 0
  },
  {
    content: 'Debiese estar consagrado y explicitar algunos mecanismos específicos para asegurarlo',
    question_number: 5,
    XAxis: 0,
    YAxis: 0
  },
  {
    content: 'No debiese quedar fijada en la Constitución, depende de muchos factores (económicos, visión del gobierno de turno, etc.)',
    question_number: 6,
    XAxis: 6,
    YAxis: 0
  },
  {
    content: 'Debe estar establecida como un principio al cual se aspira, aunque sea progresivamente',
    question_number: 6,
    XAxis: 3,
    YAxis: 0
  },
  {
    content: 'Debe garantizarse, estableciendo criterios y mecanismos concretos para realizarla',
    question_number: 6,
    XAxis: 0,
    YAxis: 0
  },
  {
    content: 'Posee muchas complejidades (por ejemplo, con otras minorías) y pone en jaque la unidad nacional',
    question_number: 7,
    XAxis: 6,
    YAxis: 0
  },
  {
    content: 'Debe estar mencionado, los Pueblos Originarios son una parte importante de nuestra identidad',
    question_number: 7,
    XAxis: 3,
    YAxis: 0
  },
  {
    content: 'Debe estar ampliamente desarrollado, pronunciándose sobre sus derechos y grados de autonomía',
    question_number: 7,
    XAxis: 0,
    YAxis: 0
  },
  {
    content: 'Debe ser fruto de un cambio cultural',
    question_number: 8,
    XAxis: 6,
    YAxis: 0
  },
  {
    content: 'Debe ser fruto de un cambio cultural',
    question_number: 8,
    XAxis: 3,
    YAxis: 0
  },
  {
    content: 'Debe ser fomentada por la Constitución, estableciendo la procedencia de leyes de cuotas u otros mecanismos',
    question_number: 8,
    XAxis: 0,
    YAxis: 0
  }
]

puts answers.length

answers.each do |answer|

  Answer.create!({
    content: answer[:content],
    question: questions[answer[:question_number] - 1],
    Xaxis: answer[:XAxis],
    Yaxis: answer[:YAxis]
    })
end

postits_content = [
  '¿Sabías que? La constitución es la Ley Fundamental del Estado establecida o aceptada como guía para su gobernación; es decir, es la norma jurídica de más alto rango en el ordenamiento político. La constitución pone las reglas de la casa.',
  '¿Qué dice una constitución? El centro de una constitución es definir los límites, organización y relaciones entre los poderes del Estado, estableciendo así las bases para los gobiernos. También garantiza los derechos y garantías de las personas y otras organizaciones de la sociedad.',
  '¡Estamos en camino a una nueva Constitución! El Gobierno ha definido los siguientes pasos: 1) Educación constitucional, 2)Diálogos ciudadanos, 3)Consejo que vele por la validez del proceso, 4)Entrega de bases con las que la presidenta escribirá una nueva constitución, 5) Aprobación de una reforma a la constitución en el congreso, 6)discusión de la nueva constitución y 7) plebiscito de ratificación',
  '¿Por qué participar en este proceso? ¿cómo hacerlo? Tenemos la posibilidad de decidir sobre los derechos que queremos reconocernos a nosotros mismos como ciudadanos y como sociedad. Podemos ser parte de la definición de las reglas del juego de nuestro país. Entre marzo y octubre de 2016 habrán diálogos comunales, provinciales y regionales a los que estamos todos invitados para ir y dar nuestra opinión. ¡Anda, que otros no definan el país en el que quieres vivir!',
  'Sabías que en Chile han existido 10 textos constitucionales? El primero data de 1811 bajo el gobierno de José Miguel Carrera. El último de 1980',
  'Sabías que la Constitución de Chile tiene 133 artículos, mientras que la de EEUU (la única que han tenido en su historia) tiene sólo 7',
  'La actual Constitución contempla los mecanismos para su propia reforma, a cargo del Congreso, pero en ningún lugar se señala cómo hacer una nueva Constitución. Hay diversas vías para hacerlo: a través del Congreso, comisiones de expertos, asambleas constituyentes, entre otras.',
  'La Constitución de 1980 es la que ha tenido más reformas en nuestra historia. Hasta 2013 había sido reformada en 33 oportunidades, habiendo reformas en cada uno de los gobiernos en que ha regido.'
]

postits_content.each do |postit_content|
  Postit.create({
    content: postit_content
    })

end

quadrants = [
  {
    name: 'El Posmo',
    title: 'Cuadrante inferior-izquierdo: “El Posmo"',
    description: 'Eres signo de nuestros tiempos. Miras con sospecha las tradicionales instituciones políticas, que crees que han impedido mayores conquistas sociales y han perpetuado la discriminación. Te gustaría una Constitución “hecha desde abajo” (Viva la AC!), y que se la juegue por los derechos sociales, aunque termine pareciendo árbol de pascua.'
  },
  {
    name: 'El Orden y Progreso',
    title: 'Cuadrante superior-derecho: “El Orden y Progreso”.',
    description: 'Si hay algo que detestas más que el populismo, es la excesiva intervención estatal en nuestras libertades económicas, que impiden el crecimiento. Crees que el país avanzará si hay orden, reglas claras, y alguien “que lleve la batuta”. Probablemente no creas en el cambio de Constitución, pero si  va a suceder igual, esperas que prime la cordura y que no terminemos en Venezuela.'
  },
  {
    name: 'El libertario',
    title: 'Cuadrante inferior-derecho: “El libertario',
    description: 'Puede que a veces tengas pesadillas con el Estado. Aunque crees que es necesario, te gustaría que fuera muy mínimo. Por el contrario, crees en el poder de los individuos, y ves con entusiasmo las posibilidades que las nuevas tecnologías le dan al ciudadano común para influir. Del mismo modo eres escéptico de los derechos sociales y de que la Constitución sea la vía para mayor justicia social. No a las soluciones “desde arriba”!'
  },
  {
    name: 'El reformista',
    title: 'Cuadrante superior-izquierdo: “El reformista',
    description: 'Crees en el derecho y en la Constitución como una herramienta para mejorar las condiciones materiales de las personas y reparar injusticias históricas…pero vamos con cuidado. Aunque las instituciones tradicionales parecen un poco oxidadas, crees que son la opción más segura y confiable. Aunque se demore más, aunque cueste un poco más…llegaremos (algún día…pero con todos)!'
  }
]

quadrants.each do |quadrant_info|
  Quadrant.create(quadrant_info)
end
