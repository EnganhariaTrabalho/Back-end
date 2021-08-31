const Levels = {
  COORDINATOR: {
    COORDINATOR_LEVEL: 'COORDENADOR',
  },

  PROFESSOR: {
    PROFESSOR_LEVEL: 'PROFESSOR',
  },

  STUDENT: {
    PROFESSOR_LEVEL: 'ALUNO',
  },
}
Object.freeze(Levels);

const isCoordinator = (level) => {
  if (Object.values(Levels.COORDINATOR).indexOf(level) > -1)
    return true;

  return false;
}

const isProfessor = (level) => {
  if (Object.values(Levels.PROFESSOR).indexOf(level) > -1)
    return true;

  return false;
}

const isStudent = (level) => {
  if (Object.values(Levels.STUDENT).indexOf(level) > -1)
    return true;

  return false;
}

const levelExists = (level) => {
  if (isCoordinator(level) || isProfessor(level) || isStudent(level))
    return true;

  return false;
}



module.exports = { Levels, levelExists, isCoordinator, isProfessor, isStudent };