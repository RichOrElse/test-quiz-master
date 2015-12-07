class QuestionDecorator < SimpleDelegator
  DEFAULT_RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  HOLLOW_BLOCK = Proc.new {|it| it}

  def initialize(model, sanitize = HOLLOW_BLOCK, renderer = DEFAULT_RENDERER)
    @sanitize = sanitize
    @renderer = renderer
    super(model)
  end

  def to_model
    __getobj__
  end

  def class
    __getobj__.class
  end

  def question
    @sanitize[ @renderer.render to_model.question ]
  end

  class << self
    def [](questionnaire, sanitizer)
      new questionnaire, sanitizer.method(:sanitize)
    end
  end

  class Collection < SimpleDelegator
    def initialize(questions, view_context)
      @questions = questions
      @view_context = view_context
      super(questions)
    end
    
    include Enumerable
    
    def each
      @questions.each do |question|
        yield QuestionDecorator[ question, @view_context ]
      end
    end
  end
end